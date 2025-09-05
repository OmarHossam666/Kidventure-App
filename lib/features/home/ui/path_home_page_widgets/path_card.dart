import 'package:flutter/material.dart';

class PathCard extends StatelessWidget {
  final String title;
  final bool locked;

  const PathCard({super.key, required this.title, this.locked = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: locked ? Colors.grey.shade200 : Colors.pink.shade50,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.shade100.withValues(alpha: 0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: locked ? Colors.grey : Colors.pink.shade300,
              width: 2,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: locked ? Colors.grey : Colors.pink.shade800,
              fontSize: 22,
            ),
          ),
        ),
        if (locked)
          const Positioned(
            right: 12,
            top: 12,
            child: Icon(Icons.lock, size: 24, color: Colors.grey),
          ),
      ],
    );
  }
}
