import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customers_tab_app_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/models/sales_order_model.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_filter_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_orders_list_view.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/unauthorized_widget.dart';

class SalesTab extends StatelessWidget {
  const SalesTab({super.key, required this.isInternalUser});
  final bool isInternalUser;

  final List<SalesOrderModel> mockSalesOrders = const [
    SalesOrderModel(
      orderNumber: '#S00001',
      customerName: 'Ahmed Hassan',
      amount: '1,938.00 LE',
      date: 'Oct 05, 2026',
      status: 'Quotation',
    ),
    SalesOrderModel(
      orderNumber: '#S00002',
      customerName: 'Mahmoud El-Sayed',
      amount: '4,650.00 LE',
      date: 'Oct 04, 2026',
      status: 'Confirmed',
    ),
    SalesOrderModel(
      orderNumber: '#S00003',
      customerName: 'Fatma Zahran',
      amount: '3,120.00 LE',
      date: 'Oct 03, 2026',
      status: 'Quotation',
    ),
    SalesOrderModel(
      orderNumber: '#S00004',
      customerName: 'Karim Abdel-Rahman',
      amount: '8,400.00 LE',
      date: 'Oct 01, 2026',
      status: 'Confirmed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomTabAppBar(title: 'Sales Orders'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: isInternalUser
                  ? Column(
                      children: [
                        SizedBox(height: 12),
                        SalesOrderFilterBar(),
                        SizedBox(height: 12),
                        Expanded(
                          child: SalesOrdersListView(
                            orders: mockSalesOrders,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.orderDetailsScreenRoute,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : const UnauthorizedWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
