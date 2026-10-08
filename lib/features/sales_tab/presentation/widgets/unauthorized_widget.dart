import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';

class UnauthorizedWidget extends StatelessWidget {
  const UnauthorizedWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.lock_outline_rounded,
            size: 80,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 16),
          const Text(
            'Access Restricted',
            style: AppStyles.semiBold16Text,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'You are not authorized to view Sales Orders.\nThis section is for internal users only.',
            style: AppStyles.regular14Text.copyWith(
              color: AppColors.textSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
