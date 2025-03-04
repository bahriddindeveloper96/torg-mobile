import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controllers/navigation_controller.dart';
import './custom_icons.dart';
import '../screens/product_add_screen.dart';

class CustomBottomNavigation extends StatelessWidget {
  final NavigationController controller;

  const CustomBottomNavigation({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xFFE5E9EB),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              height: 64,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      icon: (color) => CustomIcons.home(color: color),
                      label: 'Home',
                      index: 0,
                    ),
                    _buildNavItem(
                      icon: (color) => CustomIcons.favorites(color: color),
                      label: 'My Ads',
                      index: 1,
                    ),
                    // Placeholder for add button
                    const SizedBox(width: 56),
                    _buildNavItem(
                      icon: (color) => CustomIcons.messages(color: color),
                      label: 'Messages',
                      index: 3,
                    ),
                    _buildNavItem(
                      icon: (color) => CustomIcons.profile(color: color),
                      label: 'Account',
                      index: 4,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: -24,
              child: _buildAddButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required Widget Function(Color) icon,
    required String label,
    required int index,
  }) {
    final isSelected = controller.selectedIndex.value == index;
    final color = isSelected ? const Color(0xFF002F34) : const Color(0xFF406367);

    return InkWell(
      onTap: () => controller.changePage(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon(color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.to(() => const ProductAddScreen());
        },
        child: SizedBox(
          width: 56,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF23E5DB),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF23E5DB).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: CustomIcons.add(
                    color: const Color(0xFF002F34),
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Post Ad',
                style: TextStyle(
                  color: Color(0xFF002F34),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
