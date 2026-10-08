import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';

class OrderItemTile extends StatelessWidget {
  const OrderItemTile({super.key, required this.item});

  final OrderDetailsEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.productName,
                style: AppStyles.medium14Text.copyWith(
                  color: AppColors.textPrimaryColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text('Qty: ${item.quantity}', style: AppStyles.regular14Text),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(item.priceUnit.toString(), style: AppStyles.semiBold16Text),
      ],
    );
  }
}
