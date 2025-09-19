import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/home/data/feature_card_contents.dart';
import 'package:kidventure/features/settings/ui/settings_screen.dart';
import 'package:kidventure/features/home/ui/home_screen_widgets/custom_app_bar.dart';
import 'package:kidventure/features/home/ui/home_screen_widgets/feature_card.dart';
import 'package:kidventure/features/home/ui/home_screen_widgets/home_app_bar.dart';
import 'package:kidventure/features/chat/ui/chat_screen.dart';
import 'package:kidventure/features/home/ui/path_home_page.dart';
import 'package:kidventure/features/performance_analysis/ui/performance_analysis_screen.dart';
import 'package:kidventure/core/widgets/staggered_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeTab = "home";
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 2);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void setTab(String tab) {
    setState(() {
      activeTab = tab;
      // Switch to the appropriate page when tab changes
      switch (tab) {
        case "performance":
          _pageController.jumpToPage(0);
          break;
        case "Mind Map":
          _pageController.jumpToPage(1);
          break;
        case "home":
          _pageController.jumpToPage(2);
          break;
        case "chat":
          _pageController.jumpToPage(3);
          break;
        case "setting":
          _pageController.jumpToPage(4);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaggeredAnimation(delay: 0.1, child: _buildAppBar()),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  // Update the active tab when page changes
                  setState(() {
                    switch (index) {
                      case 0:
                        activeTab = "performance";
                        break;
                      case 1:
                        activeTab = "Mind Map";
                        break;
                      case 2:
                        activeTab = "home";
                        break;
                      case 3:
                        activeTab = "chat";
                        break;
                      case 4:
                        activeTab = "setting";
                        break;
                    }
                  });
                },
                children: [
                  const PerformanceAnalysisScreen(),
                   PathHomePage(),
                  _buildHomeContent(),
                  const ChatScreen(),
                  const SettingsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StaggeredAnimation(
        delay: 0.3,
        child: _buildBottomNavigation(),
      ),
    );
  }

  Widget _buildAppBar() {
    // Show different app bar based on active tab
    if (activeTab == "home") {
      return const HomeAppBar(
        userName: "Omar Hossam",
        userAvatar: "assets/images/user_avatar.png",
      );
    } else if (activeTab == "chat") {
      return const CustomAppBar(title: "Chat With AI");
    } else if (activeTab == "Mind Map") {
      return const CustomAppBar(title: "Mind Map");
    } else if (activeTab == "performance") {
      return const HomeAppBar(
        userName: "Omar Hossam",
        userAvatar: "assets/images/user_avatar.png",
      );
    } else if (activeTab == "setting") {
      return const CustomAppBar(title: "Settings");
    }

    return const SizedBox.shrink();
  }

  Widget _buildHomeContent() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      itemCount: featureCardContents.length,
      itemBuilder: (context, index) {
        return StaggeredAnimation(
          delay: 0.2 + (index * 0.1),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FeatureCard(featureCardContent: featureCardContents[index]),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              "performance",
              Icons.emoji_events,
              AppColors.performanceTab,
              AppColors.performanceTabBackground,
            ),
            _buildNavItem(
              "Mind Map",
              Icons.map,
              AppColors.mindMapTab,
              AppColors.mindMapTabBackground,
            ),
            _buildNavItem(
              "home",
              Icons.home,
              AppColors.homeTab,
              AppColors.homeTabBackground,
            ),
            _buildNavItem(
              "chat",
              Icons.chat_bubble,
              AppColors.chatTab,
              AppColors.chatTabBackground,
            ),
            _buildNavItem(
              "setting",
              Icons.settings,
              AppColors.settingsTab,
              AppColors.settingsTabBackground,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    String tab,
    IconData icon,
    Color iconColor,
    Color activeColor,
  ) {
    final isActive = activeTab == tab;

    return GestureDetector(
      onTap: () => setTab(tab),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon, color: iconColor, size: 28),
      ),
    );
  }
}
