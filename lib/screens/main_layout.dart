import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controllers/navigation_controller.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../widgets/bottom_navigation.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final NavigationController navigationController = Get.put(NavigationController());

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text('Categories')),
    const Center(child: Text('Add Post')),
    const Center(child: Text('My Ads')),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Obx(
            () => _screens[navigationController.selectedIndex.value],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigation(
              controller: navigationController,
            ),
          ),
        ],
      ),
    );
  }
}
