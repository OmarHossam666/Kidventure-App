import 'package:go_router/go_router.dart';
import 'package:kidventure/core/routing/routes.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/math_game_play_screen.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/math_game_screen.dart';
import 'package:kidventure/features/educational_games/games/memory_match_game/ui/memory_game_screen.dart';
import 'package:kidventure/features/educational_games/games/puzzle/ui/puzzle_screen.dart';
import 'package:kidventure/features/educational_games/games/volcano_experiment/volcano_experiment_page.dart';
import 'package:kidventure/features/educational_games/ui/educational_games_screen.dart';
import 'package:kidventure/features/flash_cards/ui/flashcards_screen.dart';
import 'package:kidventure/features/flash_cards/ui/section_detail_screen.dart';
import 'package:kidventure/features/home/ui/home_screen.dart';
import 'package:kidventure/features/home/ui/path_home_page.dart';
import 'package:kidventure/features/interactive_stories/models/interactive_story.dart';
import 'package:kidventure/features/interactive_stories/ui/interactive_stories_screen.dart';
import 'package:kidventure/features/interactive_stories/ui/interactive_story_screen.dart';
import 'package:kidventure/features/mind_maps/ui/mind_map_screen.dart';
import 'package:kidventure/features/onboarding/ui/onboarding_screen.dart';
import 'package:kidventure/features/solar_system/ui/solar_system_screen.dart';
import 'package:kidventure/features/solar_system/ui/three_dimensional_view_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onboardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.mathGameScreen,
        builder: (context, state) => MathGameScreen(),
      ),

      GoRoute(
        path: AppRoutes.memoryGameScreen,
        builder: (context, state) => const MemoryGameScreen(),
      ),

      GoRoute(
        path: AppRoutes.puzzleGameScreen,
        builder: (context, state) => const PuzzleScreen(),
      ),

      GoRoute(
        path: AppRoutes.volcanoGamePage,
        builder: (context, state) => const VolcanoExperimentPage(),
      ),

      GoRoute(
        path: AppRoutes.solarSystemScreen,
        builder: (context, state) => const SolarSystemScreen(),
      ),

      GoRoute(
        path: AppRoutes.flashcardsScreen,
        builder: (context, state) => const FlashcardsScreen(),
      ),

      GoRoute(
        path: AppRoutes.educationalGamesScreen,
        builder: (context, state) => const EducationalGamesScreen(),
      ),

      GoRoute(
        path: AppRoutes.interactiveStoriesScreen,
        builder: (context, state) => const InteractiveStoriesScreen(),
      ),

      GoRoute(
        path: AppRoutes.interactiveStoryScreen,
        builder: (context, state) {
          final story = state.extra as InteractiveStory; // pass via extra
          return InteractiveStoryScreen(story: story);
        },
      ),

      GoRoute(
        path: AppRoutes.threeDimensionalViewScreen,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return ThreeDimensionalViewScreen(
            modelPath: extra['modelPath'] as String,
            celestialBody: extra['celestialBody'],
          );
        },
      ),

      GoRoute(
        path: AppRoutes.pathHomePage,
        builder: (context, state) => PathHomePage(),
      ),

      GoRoute(
        path: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.mindMapScreen,
        builder: (context, state) => const MindMapScreen(),
      ),

      GoRoute(
        path: AppRoutes.mathGamePlayScreen,
        builder: (context, state) {
          final details = state.extra as Map<String, dynamic>;
          return MathGamePlayScreen(
            difficulty: details['difficulty'],
            equations: details['equations'],
          );
        },
      ),

      GoRoute(
        path: AppRoutes.sectionDetailScreen,
        pageBuilder: (context, state) {
          final args = state.extra as Map<String, dynamic>;

          return CustomTransitionPage(
            key: state.pageKey,
            child: SectionDetailScreen(
              section: args['section'],
              topicColor: args['topicColor'],
            ),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return child; // no animation
            },
          );
        },
      ),
    ],
  );
}
