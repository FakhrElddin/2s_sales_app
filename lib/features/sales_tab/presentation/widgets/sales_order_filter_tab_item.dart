import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';

class SalesOrderFilterTabItem extends StatelessWidget {
  const SalesOrderFilterTabItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.transparentColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: AppStyles.semiBold14Text.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? AppColors.whiteColor
                  : AppColors.primaryColor.withAlpha(200),
            ),
          ),
        ),
      ),
    );
  }
}
