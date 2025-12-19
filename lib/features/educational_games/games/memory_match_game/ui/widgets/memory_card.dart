import 'package:flutter/material.dart';
import '../../models/card_model.dart';

class MemoryCard extends StatelessWidget {
  final CardModel model;
  final VoidCallback onTap;

  const MemoryCard({super.key, required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.red.shade200, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.red.shade100, blurRadius: 4, offset: Offset(2, 2))
          ],
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (child, anim) =>
              ScaleTransition(scale: anim, child: child),
          child: model.isFlipped || model.isMatched
              ? Center(
                  key: ValueKey(true),
                  child: Text(model.flag, style: TextStyle(fontSize: 40)))
              : Center(
                  key: ValueKey(false),
                  child: Text('❓',
                      style:
                          TextStyle(fontSize: 40, color: Colors.red.shade200))),
        ),
      ),
    );
  }
}
