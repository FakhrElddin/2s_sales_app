import 'package:flutter/material.dart';
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
    final routeOrder =
        ModalRoute.of(context)?.settings.arguments as SalesOrderModel?;
    final currentOrder = order ?? routeOrder ?? defaultOrder;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OrderDetailsAppBar(orderNumber: currentOrder.orderNumber),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    OrderCustomerCard(
                      customerName: currentOrder.customerName,
                      date: currentOrder.date,
                      status: currentOrder.status,
                    ),
                    const SizedBox(height: 12),
                    const OrderItemsCard(items: defaultItems),
                    const SizedBox(height: 12),
                    OrderSummaryCard(
                      subtotal: '1,700.00 LE',
                      vat: '238.00 LE',
                      grandTotal: currentOrder.amount,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: OrderConfirmBottomBar(onConfirm: () {}),
    );
  }
}
