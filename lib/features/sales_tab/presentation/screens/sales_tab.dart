import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/di/di.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customers_tab_app_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/manager/sales_orders_cubit/sales_orders_cubit.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_filter_tab_item.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_orders_list_view.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/unauthorized_widget.dart';

class SalesTab extends StatefulWidget {
  const SalesTab({super.key, required this.isInternalUser});
  final bool isInternalUser;

  @override
  State<SalesTab> createState() => _SalesTabState();
}

class _SalesTabState extends State<SalesTab> {
  int selectedIndex = 0;
  final List<String> filterTitles = const ['All', 'Draft', 'Confirmed'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SalesOrdersCubit>()..getSalesOrders(),
      child: SafeArea(
        child: Column(
          children: [
            const CustomTabAppBar(title: 'Sales Orders'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: widget.isInternalUser
                    ? BlocBuilder<SalesOrdersCubit, SalesOrdersState>(
                        builder: (context, state) {
                          if (state is SalesOrdersError) {
                            return Center(
                              child: Text(state.failure.errorMessage),
                            );
                          } else if (state is SalesOrdersSuccess) {
                            List<SaleOrderEntity> filteredOrders =
                                state.salesOrders;
                            if (selectedIndex == 1) {
                              filteredOrders = state.salesOrders
                                  .where((order) => order.status == 'draft')
                                  .toList();
                            } else if (selectedIndex == 2) {
                              filteredOrders = state.salesOrders
                                  .where((order) => order.status == 'sale')
                                  .toList();
                            }

                            return Column(
                              children: [
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEBEDFF),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: List.generate(
                                      filterTitles.length,
                                      (index) => SalesOrderFilterTabItem(
                                        title: filterTitles[index],
                                        isSelected: selectedIndex == index,
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Expanded(
                                  child: SalesOrdersListView(
                                    orders: filteredOrders,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          }
                        },
                      )
                    : const UnauthorizedWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
