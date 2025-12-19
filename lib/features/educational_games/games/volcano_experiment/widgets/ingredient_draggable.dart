import 'package:flutter/material.dart';
import '../models/ingredient.dart';

class IngredientDraggable extends StatelessWidget {
  final Ingredient ingredient;
  final double iconSize;

  const IngredientDraggable({
    super.key,
    required this.ingredient,
    this.iconSize = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Draggable<String>(
          data: ingredient.id,
          feedback: Transform.scale(
            scale: 1.2,
            child: Icon(Icons.science, size: iconSize, color: ingredient.color),
          ),
          childWhenDragging: Opacity(
            opacity: 0.3,
            child: Icon(Icons.science, size: iconSize, color: ingredient.color),
          ),
          child: Icon(Icons.science, size: iconSize, color: ingredient.color),
        ),
        SizedBox(height: 6),
        Text(
          ingredient.label,
          style: TextStyle(
            fontSize: iconSize * 0.14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
