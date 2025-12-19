// lib/screens/section_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import '../data/emoji_helpers.dart';
import '../models/section.dart';

class SectionDetailScreen extends StatefulWidget {
  final Section section;
  final Color topicColor;

  const SectionDetailScreen({
    required this.section,
    required this.topicColor,
    super.key,
  });

  @override
  State<SectionDetailScreen> createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.section.videoId) ?? '';
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.04;
    final gridSpacing = screenWidth * 0.02;
    final screenHeight = MediaQuery.of(context).size.height;
    final crossAxisCount = (screenWidth / 180).floor();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: widget.topicColor.withValues(alpha: 0.4),
        title: Text(
          widget.section.name,
          style: GoogleFonts.crimsonText(
            fontSize: screenWidth * 0.07,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(padding),
                  child: YoutubePlayer(
                    controller: _youtubeController,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.orangeAccent,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.section.flipItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount > 1 ? crossAxisCount : 1,
                  mainAxisSpacing: gridSpacing,
                  crossAxisSpacing: gridSpacing,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final flipItem = widget.section.flipItems[index];
                  return FlipCard(
                    controller: FlipCardController(),
                    onTapFlipping: true,
                    rotateSide: RotateSide.right,
                    frontWidget: _buildFlipCardFront(flipItem, padding),
                    backWidget: _buildFlipCardBack(flipItem, padding),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlipCardFront(FlipCardItem item, double padding) {
    if (widget.section.name == 'Colors') {
      final color = getColorFromName(item.explanation);
      return Container(
        decoration: BoxDecoration(
          color: color ?? Colors.grey,
          borderRadius: BorderRadius.circular(padding),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
      );
    }
    final backgroundColor =
        Color.lerp(
          widget.topicColor,
          const Color.fromARGB(255, 253, 235, 235),
          0.8,
        )!;
    final iconSize = padding * 3;
    Widget content;
    switch (widget.section.name) {
      case 'Animals':
        content = Text(
          getAnimalEmoji(item.explanation),
          style: TextStyle(fontSize: iconSize, color: widget.topicColor),
        );
        break;
      case 'Fruits':
        content = Text(
          getFruitEmoji(item.explanation),
          style: TextStyle(fontSize: iconSize, color: widget.topicColor),
        );
        break;
      case 'Vehicles':
        content = Text(
          getVehicleEmoji(item.explanation),
          style: TextStyle(fontSize: iconSize, color: widget.topicColor),
        );
        break;
      case 'Numbers':
        content = Text(
          getNumberEmoji(item.explanation),
          style: TextStyle(fontSize: iconSize, color: widget.topicColor),
        );
        break;
      case 'Plants':
        content = Text(
          getPlantEmoji(item.explanation),
          style: TextStyle(fontSize: iconSize, color: widget.topicColor),
        );
        break;
      case 'Weather':
        content = Text(
          getWeatherEmoji(item.explanation),
          style: TextStyle(fontSize: iconSize, color: widget.topicColor),
        );
        break;
      case 'Sports':
        content = Text(
          getSportsEmoji(item.explanation),
          style: TextStyle(fontSize: iconSize, color: widget.topicColor),
        );
        break;
      case 'Music':
        content = Text(
          getMusicEmoji(item.explanation),
          style: TextStyle(fontSize: iconSize, color: widget.topicColor),
        );
        break;
      default:
        content = Icon(
          item.icon,
          size: iconSize * 0.8,
          color: widget.topicColor,
        );
    }
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(padding),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: content),
    );
  }

  Widget _buildFlipCardBack(FlipCardItem item, double padding) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(padding),
        border: Border.all(color: widget.topicColor.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(padding),
      child: Center(
        child: Text(
          item.explanation,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: padding * 2.5,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
