import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/models/sales_order_model.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_card.dart';

class SalesOrdersListView extends StatelessWidget {
  const SalesOrdersListView({
    super.key,
    required this.orders,
    required this.onTap,
  });

  final List<SalesOrderModel> orders;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final order = orders[index];
        return SalesOrderCard(order: order, onTap: onTap);
      },
    );
  }
}
