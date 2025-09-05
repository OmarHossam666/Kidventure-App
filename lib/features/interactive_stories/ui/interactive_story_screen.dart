import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constants/app_colors.dart';
import '../models/interactive_story.dart';
import '../../../core/apis/tts_service.dart';

class InteractiveStoryScreen extends StatefulWidget {
  final InteractiveStory story;

  const InteractiveStoryScreen({super.key, required this.story});

  @override
  State<InteractiveStoryScreen> createState() => _InteractiveStoryScreenState();
}

class _InteractiveStoryScreenState extends State<InteractiveStoryScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _showEnding = false;
  late StoryEnding _selectedEnding;
  final TtsService _ttsService = TtsService();
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _initializeTts();
  }

  Future<void> _initializeTts() async {
    await _ttsService.initialize();

    // Set up callbacks
    _ttsService.onStartCallback = () {
      setState(() {
        _isSpeaking = true;
      });
    };

    _ttsService.onCompletionCallback = () {
      setState(() {
        _isSpeaking = false;
      });
    };

    _ttsService.onErrorCallback = (_) {
      setState(() {
        _isSpeaking = false;
      });
    };
  }

  @override
  void dispose() {
    _pageController.dispose();
    _ttsService.dispose();
    super.dispose();
  }

  void _selectChoice(StoryChoice choice) {
    setState(() {
      _selectedEnding = choice.ending;
      _showEnding = true;
    });
  }

  void _replayStory() {
    setState(() {
      _showEnding = false;
      _currentPage = 0;
    });
    // Use a post-frame callback to ensure the controller is attached
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  // Handle speech for current segment or ending
  Future<void> _speakText(String text) async {
    if (_isSpeaking) {
      await _ttsService.stop();
      setState(() {
        _isSpeaking = false;
      });
    } else {
      await _ttsService.speak(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.story.title,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _showEnding ? _buildEndingScreen() : _buildStoryContent(),
    );
  }

  Widget _buildStoryContent() {
    return Column(
      children: [
        // Page view for story segments
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.story.segments.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                // Stop speech when changing pages
                if (_isSpeaking) {
                  _ttsService.stop();
                  _isSpeaking = false;
                }
              });
            },
            itemBuilder: (context, index) {
              final segment = widget.story.segments[index];
              return _buildSegment(segment, index);
            },
          ),
        ),
        // Dot indicator
        Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: widget.story.segments.length,
            effect: WormEffect(
              dotColor: AppColors.borderColor,
              activeDotColor: AppColors.primary,
              dotHeight: 10,
              dotWidth: 10,
            ),
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSegment(StorySegment segment, int index) {
    final isLastSegment = index == widget.story.segments.length - 1;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Story text
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      segment.text,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (segment.puzzle != null) ...[
                    const SizedBox(height: 20),
                    _buildPuzzle(segment.puzzle!),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          // Voice assistant button
          ElevatedButton.icon(
            onPressed: () => _speakText(segment.text),
            icon: Icon(
              _isSpeaking ? Icons.stop : Icons.volume_up,
              size: 18,
              color: AppColors.background,
            ),
            label: Text(
              _isSpeaking ? "Stop" : "Listen",
              style: const TextStyle(fontSize: 18, color: AppColors.background),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonSecondary,
            ),
          ),

          const SizedBox(height: 16),

          // Choices for the last segment
          if (isLastSegment) ...[
            const Divider(),
            const Text(
              "What will you do?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            ...widget.story.choices.map((choice) => _buildChoiceButton(choice)),
          ] else ...[
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: AppColors.background),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPuzzle(Puzzle puzzle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Puzzle",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            puzzle.question,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () => _speakText(puzzle.question),
                icon: Icon(
                  _isSpeaking ? Icons.stop : Icons.volume_up,
                  size: 16,
                  color: AppColors.background,
                ),
                label: Text(
                  _isSpeaking ? "Stop" : "Listen",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.background,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonSecondary,
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text(
                            "Hint",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            "The answer is: ${puzzle.answer}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.buttonPrimary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.background,
                                ),
                              ),
                            ),
                          ],
                        ),
                  );
                },
                child: const Text(
                  "Need a hint?",
                  style: TextStyle(fontSize: 16, color: AppColors.secondary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceButton(StoryChoice choice) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ElevatedButton(
        onPressed: () => _selectChoice(choice),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          choice.choiceText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.background,
          ),
        ),
      ),
    );
  }

  Widget _buildEndingScreen() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Story lottie
            Lottie.asset(
              widget.story.lottiePath,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 24),

            // Ending text
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    _selectedEnding.text,
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Skill: ${_selectedEnding.skillFocused}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Voice assistant button
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () => _speakText(_selectedEnding.text),
                icon: Icon(
                  _isSpeaking ? Icons.stop : Icons.volume_up,
                  size: 18,
                  color: AppColors.background,
                ),
                label: Text(
                  _isSpeaking ? "Stop" : "Listen",
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.background,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonSecondary,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _replayStory,
                    icon: const Icon(
                      Icons.replay,
                      size: 16,
                      color: AppColors.background,
                    ),
                    label: const Text(
                      "Replay Story",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.background,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonSecondary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 16,
                      color: AppColors.background,
                    ),
                    label: const Text(
                      "Back to Stories",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.background,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
