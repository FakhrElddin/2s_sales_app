import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';

class OrderDetailsAppBar extends StatelessWidget {
  const OrderDetailsAppBar({super.key, required this.orderNumber});

  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    final titleText = orderNumber.startsWith('#')
        ? 'Order $orderNumber'
        : 'Order #$orderNumber';

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
            constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            splashRadius: 20,
          ),
          const SizedBox(width: 8),
          Text(titleText, style: AppStyles.semiBold16Text),
        ],
      ),
    );
  }
}
