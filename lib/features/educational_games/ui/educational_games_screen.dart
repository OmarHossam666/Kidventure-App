import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/core/constants/app_text_styles.dart';
import 'package:kidventure/features/educational_games/data/categories.dart';
import 'package:kidventure/features/educational_games/data/games.dart';
import 'package:kidventure/features/educational_games/models/game.dart';
import 'package:kidventure/features/educational_games/ui/widgets/game_card.dart';
import 'package:kidventure/core/widgets/staggered_animation.dart';

class EducationalGamesScreen extends StatefulWidget {
  const EducationalGamesScreen({super.key});

  @override
  State<EducationalGamesScreen> createState() => _EducationalGamesScreenState();
}

class _EducationalGamesScreenState extends State<EducationalGamesScreen> {
  String selectedCategory = 'all';
  final ScrollController _scrollController = ScrollController();

  List<Game> get filteredGames {
    return selectedCategory == 'all'
        ? games
        : games.where((game) => game.category == selectedCategory).toList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back, color: AppColors.primary),
            ),
            backgroundColor: AppColors.background,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Educational Games',
                style: AppTextStyles.headingMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: StaggeredAnimation(
                delay: 0.1,
                child: _buildCategoryChips(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => StaggeredAnimation(
                  delay: 0.2 + (index * 0.1),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GameCard(game: filteredGames[index]),
                  ),
                ),
                childCount: filteredGames.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(category.icon, size: 18),
                  const SizedBox(width: 8),
                  Text(category.name),
                ],
              ),
              selected: selectedCategory == category.id,
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                color:
                    selectedCategory == category.id
                        ? Colors.white
                        : AppColors.primary,
              ),
              onSelected: (_) {
                setState(() {
                  selectedCategory = category.id;
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
