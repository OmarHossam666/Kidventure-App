import 'package:flutter/material.dart';
import 'dart:async';

import '../data/card_repository.dart';
import '../models/card_model.dart';
import 'widgets/memory_card.dart';
import 'widgets/stats_panel.dart';
import 'widgets/reset_button.dart';
import 'widgets/morning_dialog.dart';

class MemoryGameScreen extends StatefulWidget {
  const MemoryGameScreen({super.key});

  @override
  MemoryGameScreenState createState() => MemoryGameScreenState();
}

class MemoryGameScreenState extends State<MemoryGameScreen> {
  late List<CardModel> cards;
  int previousIndex = -1;
  int moves = 0;
  bool isProcessing = false;
  bool isMemorizationPhase = true;

  // Timer
  int _secondsElapsed = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _resetGame();
    _maybeShowMorningDialog();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondsElapsed = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => _secondsElapsed++);
    });
  }

  void _maybeShowMorningDialog() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 18) {
      Future.delayed(Duration(milliseconds: 500), () {
        if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => MorningDialog(),
        );
        }
      });
    }
  }

  void _onCardTap(int index) {
    if (isMemorizationPhase) return;
    final card = cards[index];
    if (isProcessing || card.isFlipped || card.isMatched) return;

    setState(() {
      card.isFlipped = true;
      moves++;
    });

    if (previousIndex == -1) {
      previousIndex = index;
    } else {
      isProcessing = true;
      final prev = cards[previousIndex];
      if (prev.flag == card.flag) {
        setState(() {
          prev.isMatched = true;
          card.isMatched = true;
        });
        _endPairCheck();
      } else {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            prev.isFlipped = false;
            card.isFlipped = false;
          });
          _endPairCheck();
        });
      }
    }
  }

  void _endPairCheck() {
    previousIndex = -1;
    isProcessing = false;
    _checkWinCondition();
  }

  void _checkWinCondition() {
    if (cards.every((c) => c.isMatched)) {
      _timer?.cancel();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.red.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Center(
              child: Text('Congratulations!',
                  style: TextStyle(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.bold))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('You completed the game in $moves moves.',
                  textAlign: TextAlign.center),
              SizedBox(height: 8),
              Text('Time elapsed: $_secondsElapsed seconds',
                  textAlign: TextAlign.center),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: Text('Return to Home',
                  style: TextStyle(color: Colors.red.shade700)),
            ),
          ],
        ),
      );
    }
  }

  void _resetGame() {
    setState(() {
      cards = CardRepository.initializeCards();
      moves = 0;
      previousIndex = -1;
      isProcessing = false;
      isMemorizationPhase = true;
    });
    _startTimer();
    // بعد 3 ثوانٍ إخفاء البطاقات
    Timer(Duration(seconds: 3), () {
      setState(() {
        for (var c in cards) {
          c.isFlipped = false;
        }
        isMemorizationPhase = false;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF5F5), Colors.red.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatsPanel(moves: moves, seconds: _secondsElapsed),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: cards.length,
                itemBuilder: (_, i) => MemoryCard(
                  model: cards[i],
                  onTap: () => _onCardTap(i),
                ),
              ),
            ),
            ResetButton(onPressed: _resetGame),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
