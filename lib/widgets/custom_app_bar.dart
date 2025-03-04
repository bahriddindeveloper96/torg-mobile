import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showLogo;
  final VoidCallback? onBackPressed;
  final bool showBottomBorder;
  final Color backgroundColor;
  final double elevation;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.showLogo = true,
    this.onBackPressed,
    this.showBottomBorder = true,
    this.backgroundColor = Colors.white,
    this.elevation = 0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: onBackPressed != null
          ? IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_back, color: AppColors.primary),
              ),
              onPressed: onBackPressed,
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          : showLogo
              ? Row(
                  children: [
                    const Text(
                      'TORG',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      '.',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      'uz',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                )
              : null,
      actions: actions ??
          [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.black),
              onPressed: () {},
            ),
          ],
      bottom: showBottomBorder
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey[300],
                height: 1.0,
              ),
            )
          : null,
    );
  }
}