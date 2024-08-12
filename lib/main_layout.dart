import 'package:filmo/core/constants/app_colors.dart';
import 'package:filmo/features/home/presentation/pages/home_page.dart';
import 'package:filmo/features/user/presentation/pages/user_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainLayout extends StatefulWidget {
  final int id;
  const MainLayout({super.key, required this.id});

  @override
  State<MainLayout> createState() => _BottomNavState();
}

class _BottomNavState extends State<MainLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomePage(id: widget.id),
      UserPage(id: widget.id),
    ];

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        elevation: 10,
        backgroundColor: AppColors.cardBackgroundColor,
        shadowColor: AppColors.cardOutlineColor,
        centerTitle: true,
        title: Image.asset(
          "assets/images/full_logo.png",
          width: 32.w,
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: AppColors.cardBackgroundColor,
        iconSize: 6.w,
        selectedIndex: _currentIndex,
        showElevation: true,
        shadows: const [
          BoxShadow(color: AppColors.cardOutlineColor, blurRadius: 4)
        ],
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          FlashyTabBarItem(
            activeColor: AppColors.secondaryColor,
            inactiveColor: AppColors.secondaryColor.withOpacity(0.5),
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.secondaryColor,
            inactiveColor: AppColors.secondaryColor.withOpacity(0.5),
            icon: const Icon(Icons.person),
            title: const Text('User'),
          ),
        ],
      ),
    );
  }
}
