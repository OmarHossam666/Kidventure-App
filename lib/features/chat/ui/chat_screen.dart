import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/chat/models/chat_message.dart';
import 'package:kidventure/core/apis/gemini_service.dart';
import 'package:kidventure/core/apis/service_locator.dart';
import 'package:kidventure/core/apis/speech_service.dart';
import 'package:kidventure/features/chat/ui/widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with WidgetsBindingObserver {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  // Services
  late final GeminiService _geminiService;
  late final SpeechService _speechService;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  // Initialize services in a separate method to handle potential errors
  Future<void> _initializeServices() async {
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      WidgetsBinding.instance.addObserver(this);

      // Get services from service locator
      _geminiService = ServiceLocator.instance.get<GeminiService>();
      _speechService = ServiceLocator.instance.get<SpeechService>();

      // Set up speech service callbacks
      _speechService.onSpeechResult = _onSpeechResult;
      _speechService.onListeningStateChanged = _onListeningStateChanged;
      _speechService.onError = _showFeedback;
    } catch (error) {
      _showFeedback('Error initializing services: ${error.toString()}');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      // Stop listening when app goes to background
      if (_speechService.isListening) {
        _speechService.stopListening();
      }
    }
  }

  // Show feedback to the user
  void _showFeedback(String message) {
    if (!mounted) return;

    final feedbackMessage = ChatMessage(role: "assistant", content: message);
    setState(() {
      _messages.add(feedbackMessage);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  // Handle listening state changes
  void _onListeningStateChanged(bool isListening) {
    if (mounted) {
      setState(() {
        // Update UI based on listening state
      });
    }
  }

  // Handle speech recognition results
  void _onSpeechResult(String recognizedText) {
    if (!mounted) return;

    setState(() {
      _textController.text = recognizedText;
    });

    if (recognizedText.isNotEmpty) {
      _handleSendMessage();
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> _handleSendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    final userMessage = ChatMessage(role: 'user', content: text);

    setState(() {
      _messages.add(userMessage);
      _textController.clear();
      _isLoading = true;
    });

    // Scroll to bottom after adding the user message
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    try {
      // Convert messages to format expected by the service
      final messageHistory =
          _messages
              .map(
                (message) => {
                  'role': message.role,
                  'content': message.content ?? '',
                },
              )
              .toList();

      // Use the service to send the message
      final response = await _geminiService.sendMessage(messageHistory);

      if (!mounted) return;

      final assistantMessage = ChatMessage(
        role: 'assistant',
        content: response,
      );

      setState(() {
        _messages.add(assistantMessage);
      });

      // Scroll to bottom after adding the assistant message
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    } catch (error) {
      if (!mounted) return;

      final assistantMessage = ChatMessage(
        role: 'assistant',
        content:
            'Oops! My brain got a little tired. Let\'s try again in a bit, okay? Maybe we can talk about dinosaurs or space next time! 🚀✨',
      );
      setState(() {
        _messages.add(assistantMessage);
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.background,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: AppColors.primary,
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText:
                        _speechService.isListening
                            ? 'Listening...'
                            : 'Ask me anything!',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onSubmitted: (_) => _handleSendMessage(),
                ),
              ),
              IconButton(
                color: AppColors.primary,
                icon: Icon(_speechService.isListening ? Icons.stop : Icons.mic),
                onPressed: () {
                  if (!_speechService.isListening) {
                    _speechService.startListening();
                  } else {
                    _speechService.stopListening();
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _handleSendMessage,
                color: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _messages.length) {
                  return ChatBubble(message: _messages[index]);
                } else {
                  // This is the loading bubble for the assistant
                  return ChatBubble(
                    message: ChatMessage(
                      role: 'assistant',
                      content: 'Thinking...',
                    ),
                    isLoading: true,
                  );
                }
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }
}
