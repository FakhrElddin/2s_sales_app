import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';

class OrderConfirmBottomBar extends StatelessWidget {
  const OrderConfirmBottomBar({
    super.key,
    this.onConfirm,
  });

  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(
          top: BorderSide(color: AppColors.cardBorderColor, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        top: false,
        child: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: AppColors.transparentColor,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onConfirm,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: AppColors.whiteColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Confirm Order',
                    style: AppStyles.semiBold14Text.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
