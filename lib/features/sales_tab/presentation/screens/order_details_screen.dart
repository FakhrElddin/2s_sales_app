import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/di/di.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/manager/order_details_cubit/order_details_cubit.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/models/order_item_model.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/models/sales_order_model.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_confirm_bottom_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_customer_card.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_details_app_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_items_card.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_summary_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, this.order});

  final SalesOrderModel? order;

  static const SalesOrderModel defaultOrder = SalesOrderModel(
    orderNumber: '#S00001',
    customerName: 'Ahmed Hassan',
    amount: '1,938.00 LE',
    date: 'Oct 05, 2026',
    status: 'Quotation',
  );

  static const List<OrderItemModel> defaultItems = [
    OrderItemModel(
      name: "Men's Cotton Pajama Set",
      quantity: 2,
      price: '1,700.00 LE',
    ),
    OrderItemModel(name: 'Sateen Sleep Mask', quantity: 1, price: '0.00 LE'),
  ];

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)?.settings.arguments as SaleOrderEntity;
    //final currentOrder = order ?? routeOrder ?? defaultOrder;

    return BlocProvider(
      create: (context) =>
          getIt<OrderDetailsCubit>()..getOrderDetails(orderId: order.id),
      child: Scaffold(
        body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            if (state is OrderDetailsSuccess) {
              return SafeArea(
                child: Column(
                  children: [
                    OrderDetailsAppBar(orderNumber: order.orderNumber),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            OrderCustomerCard(
                              customerName: order.customerName,
                              date: order.date,
                              status: order.status,
                            ),
                            const SizedBox(height: 12),
                            const OrderItemsCard(items: defaultItems),
                            const SizedBox(height: 12),
                            OrderSummaryCard(
                              subtotal: '1,700.00 LE',
                              vat: '238.00 LE',
                              grandTotal: 'currentOrder.amount',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is OrderDetailsError) {
              return Center(child: Text(state.failure.errorMessage));
            } else {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            }
          },
        ),
        bottomNavigationBar: OrderConfirmBottomBar(onConfirm: () {}),
      ),
    );
  }
}
