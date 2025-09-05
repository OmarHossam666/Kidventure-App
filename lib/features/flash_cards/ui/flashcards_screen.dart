import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/flash_cards/data/topics.dart';
import 'widgets/topic_card.dart';
import '../../../core/widgets/staggered_animation.dart';

class FlashcardsScreen extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Choose a Topic to Learn',
          style: GoogleFonts.crimsonText(
            fontSize: width > 600 ? width * 0.08 : width * 0.06,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.04,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: topics.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return StaggeredAnimation(
                      delay: index * 0.2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.01),
                        child: TopicCard(
                          topic: topics[index],
                          animationDelay: Duration(milliseconds: index * 100),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
