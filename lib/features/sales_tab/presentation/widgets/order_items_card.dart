import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/utils/app_styles.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/models/order_item_model.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_item_tile.dart';

class OrderItemsCard extends StatelessWidget {
  const OrderItemsCard({super.key, required this.items});

  final List<OrderItemModel> items;

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
              'ORDER ITEMS',
              style: AppStyles.semiBold11Text,
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.cardBorderColor,
                height: 22,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                return OrderItemTile(item: items[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
