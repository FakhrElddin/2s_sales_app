import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_status_badge.dart';

class OrderCustomerCard extends StatelessWidget {
  const OrderCustomerCard({
    super.key,
    required this.customerName,
    required this.date,
    required this.status,
  });

  final String customerName;
  final String date;
  final String status;

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    customerName,
                    style: AppStyles.semiBold16Text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: AppStyles.regular14Text,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            SalesOrderStatusBadge(status: status),
          ],
        ),
      ),
    );
  }
}
