// lib/widgets/topic_card.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kidventure/core/routing/routes.dart';
import '../../models/topic.dart';
import '../../data/sections_data.dart';

class TopicCard extends StatefulWidget {
  final Topic topic;
  final Duration animationDelay;

  const TopicCard({
    super.key,
    required this.topic,
    required this.animationDelay,
  });

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _translateAnimation = Tween<double>(
      begin: 20.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    Future.delayed(widget.animationDelay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToSection() {
    // Add a default value or use tryWhere to handle cases where no matching section is found
    final section = sections.firstWhere(
      (s) => s.id == widget.topic.id,
      orElse: () => sections.first, // Provide a fallback section
    );
    context.push(
      AppRoutes.sectionDetailScreen,
      extra: {'section': section, 'topicColor': widget.topic.color},
    );

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardPadding = screenWidth * 0.04;
    final iconSize = screenWidth * 0.15;
    final nameFont = screenWidth * 0.05;
    final descFont = screenWidth * 0.04;
    final buttonFont = screenWidth * 0.04;
    final buttonPaddingV = screenWidth * 0.025;
    final buttonPaddingH = screenWidth * 0.08;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _translateAnimation.value),
          child: Transform.scale(scale: _scaleAnimation.value, child: child),
        );
      },
      child: GestureDetector(
        onTap: _navigateToSection,
        child: Container(
          padding: EdgeInsets.all(cardPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(cardPadding),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.topic.color.withValues(alpha: 0.2),
                ),
                child: Icon(
                  widget.topic.icon,
                  color: widget.topic.color,
                  size: iconSize * 0.5,
                ),
              ),
              SizedBox(height: cardPadding),
              Text(
                widget.topic.name,
                style: TextStyle(
                  fontSize: nameFont,
                  fontWeight: FontWeight.bold,
                  color: widget.topic.color,
                ),
              ),
              SizedBox(height: cardPadding * 0.5),
              Text(
                widget.topic.description,
                style: TextStyle(fontSize: descFont, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: cardPadding),
              ElevatedButton(
                onPressed: _navigateToSection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.topic.color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cardPadding),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonPaddingH,
                    vertical: buttonPaddingV,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Start Learning',
                      style: TextStyle(fontSize: buttonFont),
                    ),
                    SizedBox(width: buttonPaddingH * 0.1),
                    Transform.translate(
                      offset: const Offset(0, 1),
                      child: Icon(
                        Icons.arrow_forward,
                        size: buttonFont * 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
