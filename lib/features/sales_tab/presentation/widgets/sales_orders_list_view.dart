import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_card.dart';

class SalesOrdersListView extends StatelessWidget {
  const SalesOrdersListView({super.key, required this.orders});

  final List<SaleOrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final order = orders[index];
        return SalesOrderCard(
          order: order,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.orderDetailsScreenRoute,
              arguments: order,
            );
          },
        );
      },
    );
  }
}
