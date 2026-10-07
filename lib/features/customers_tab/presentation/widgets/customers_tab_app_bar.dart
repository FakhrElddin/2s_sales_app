import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_images.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';

class CustomTabAppBar extends StatelessWidget {
  const CustomTabAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(bottom: BorderSide(color: Color(0x99E4E7FE), width: 1)),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.appLogoImage, height: 32, fit: BoxFit.contain),
          const SizedBox(width: 10),
          Text(title, style: AppStyles.bold22Text),
        ],
      ),
    );
  }
}
