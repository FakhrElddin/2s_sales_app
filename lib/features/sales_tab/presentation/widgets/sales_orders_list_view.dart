import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/manager/sales_orders_cubit/sales_orders_cubit.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_card.dart';

class SalesOrdersListView extends StatelessWidget {
  const SalesOrdersListView({super.key, required this.orders});

  final List<SaleOrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () async {
        BlocProvider.of<SalesOrdersCubit>(context).getSalesOrders();
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
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
      ),
    );
  }
}
