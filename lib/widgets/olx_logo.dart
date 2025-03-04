import 'package:flutter/material.dart';
import '../constants/colors.dart';

class OlxLogo extends StatelessWidget {
  final double height;
  
  const OlxLogo({
    Key? key,
    this.height = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'OLX',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: height * 0.8,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 2),
            width: height * 0.4,
            height: height * 0.4,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
