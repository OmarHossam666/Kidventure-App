import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import '../data/transportation_data.dart';
import '../models/transportation_model.dart';
import 'widgets/gamification_row.dart';
import 'widgets/emoji_circle.dart';
import 'widgets/letter_drop_target.dart';
import 'widgets/letter_draggable.dart';
import 'widgets/answer_button.dart';
import 'widgets/dialogs.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  PuzzleScreenState createState() => PuzzleScreenState();
}

class PuzzleScreenState extends State<PuzzleScreen> {
  late TransportationVehicle currentVehicle;
  late List<String> letters;
  late List<String> shuffledLetters;
  List<String> selectedLetters = [];

  int score = 0;
  int level = 1;
  int puzzlesSolved = 0;

  @override
  void initState() {
    super.initState();
    _initializePuzzle();
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 18) {
      Future.delayed(Duration(milliseconds: 500), () {
        if (mounted) {
          showMorningDialog(context);
        }
      });
    }
  }

  void _initializePuzzle() {
    currentVehicle = transportationVehicles.first;
    letters = currentVehicle.name.split('');
    shuffledLetters = List.from(letters)..shuffle();
    selectedLetters = List.filled(letters.length, '');
  }

  void _checkAnswer() {
    if (selectedLetters.join() == currentVehicle.name) {
      setState(() {
        score += 10;
        puzzlesSolved++;
        if (puzzlesSolved % 3 == 0) level++;
      });
      showSuccessDialog(context, _nextPuzzle);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Try again!',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  void _nextPuzzle() {
    setState(() {
      int currentIndex = transportationVehicles.indexOf(currentVehicle);
      currentVehicle =
          transportationVehicles[(currentIndex + 1) %
              transportationVehicles.length];
      letters = currentVehicle.name.split('');
      shuffledLetters = List.from(letters)..shuffle();
      selectedLetters = List.filled(letters.length, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.background),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GamificationRow(score: score, level: level),
                SizedBox(height: screenWidth * 0.05),
                EmojiCircle(emoji: currentVehicle.emoji),
                SizedBox(height: screenWidth * 0.075),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: letters.length > 6 ? 6 : letters.length,
                    childAspectRatio: 1,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenWidth * 0.02,
                  ),
                  itemCount: letters.length,
                  itemBuilder: (context, index) {
                    return LetterDropTarget(
                      letter: letters[index],
                      selectedLetter: selectedLetters[index],
                      onAccept: (data) {
                        setState(() {
                          selectedLetters[index] = data;
                          shuffledLetters.remove(data);
                        });
                      },
                    );
                  },
                ),
                SizedBox(height: screenWidth * 0.075),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: screenWidth * 0.02,
                    runSpacing: screenWidth * 0.02,
                    children:
                        shuffledLetters.map((letter) {
                          return LetterDraggable(letter: letter);
                        }).toList(),
                  ),
                ),
                SizedBox(height: screenWidth * 0.1),
                AnswerButton(onPressed: _checkAnswer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
