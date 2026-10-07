import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/core/di/di.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/features/customers_tab/presentation/widgets/customers_tab_app_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/manager/sales_orders_cubit/sales_orders_cubit.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_order_filter_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/sales_orders_list_view.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/unauthorized_widget.dart';

class SalesTab extends StatelessWidget {
  const SalesTab({super.key, required this.isInternalUser});
  final bool isInternalUser;

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
                child: isInternalUser
                    ? BlocBuilder<SalesOrdersCubit, SalesOrdersState>(
                        builder: (context, state) {
                          if (state is SalesOrdersError) {
                            return Center(
                              child: Text(state.failure.errorMessage),
                            );
                          } else if (state is SalesOrdersSuccess) {
                            return Column(
                              children: [
                                SizedBox(height: 12),
                                SalesOrderFilterBar(),
                                SizedBox(height: 12),
                                Expanded(
                                  child: SalesOrdersListView(
                                    orders: state.salesOrders,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.orderDetailsScreenRoute,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Center(
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
