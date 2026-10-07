import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.subtotal,
    required this.vat,
    required this.grandTotal,
  });

  final String subtotal;
  final String vat;
  final String grandTotal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.cardBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SUMMARY',
              style: AppStyles.semiBold11Text,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal',
                  style: AppStyles.regular14Text,
                ),
                Text(
                  subtotal,
                  style: AppStyles.medium14Text.copyWith(
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'VAT (14%)',
                  style: AppStyles.regular14Text,
                ),
                Text(
                  vat,
                  style: AppStyles.medium14Text.copyWith(
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: AppColors.cardBorderColor,
              height: 1,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Grand Total', style: AppStyles.semiBold16Text),
                Text(grandTotal, style: AppStyles.bold20Text),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
