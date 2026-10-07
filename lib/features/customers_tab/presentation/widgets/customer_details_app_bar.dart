import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';

class CustomerDetailsAppBar extends StatelessWidget {
  const CustomerDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(
          bottom: BorderSide(color: AppColors.cardBorderColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textPrimaryColor,
              size: 20,
            ),
            padding: EdgeInsets.zero,
          ),
          const SizedBox(width: 8),
          const Text('Customer Details', style: AppStyles.semiBold16Text),
        ],
      ),
    );
  }
}
