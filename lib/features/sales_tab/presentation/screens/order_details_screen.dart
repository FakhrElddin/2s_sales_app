import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twos_home_wear_app/core/di/di.dart';
import 'package:twos_home_wear_app/core/utils/app_colors.dart';
import 'package:twos_home_wear_app/core/widgets/custom_app_dialog.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/manager/order_details_cubit/order_details_cubit.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_confirm_bottom_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_customer_card.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_details_app_bar.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_items_card.dart';
import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_summary_card.dart';

import 'package:twos_home_wear_app/features/sales_tab/presentation/widgets/order_details_error_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)?.settings.arguments as SaleOrderEntity;

    return BlocProvider(
      create: (context) =>
          getIt<OrderDetailsCubit>()..getOrderDetails(orderId: order.id),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              OrderDetailsAppBar(orderNumber: order.orderNumber),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                        buildWhen: (previous, current) {
                          return current is ConfirmOrderSuccess;
                        },
                        builder: (context, state) {
                          return OrderCustomerCard(
                            customerName: order.customerName,
                            date: order.date,
                            status: state is ConfirmOrderSuccess
                                ? 'sale'
                                : order.status,
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                        buildWhen: (previous, current) {
                          return current is OrderDetailsLoading ||
                              current is OrderDetailsSuccess ||
                              current is OrderDetailsError;
                        },
                        builder: (context, state) {
                          if (state is OrderDetailsSuccess) {
                            double subtotal = 0;
                            for (var item in state.orderDetails) {
                              subtotal += item.priceSubtotal;
                            }
                            double grandTotal = order.amountTotal;
                            double vat = (grandTotal - subtotal) > 0
                                ? (grandTotal - subtotal)
                                : 0;
                            return Column(
                              children: [
                                OrderItemsCard(items: state.orderDetails),
                                const SizedBox(height: 12),
                                OrderSummaryCard(
                                  subtotal: '$subtotal LE',
                                  vat: '$vat LE',
                                  grandTotal: '$grandTotal LE',
                                ),
                              ],
                            );
                          } else if (state is OrderDetailsError) {
                            return OrderDetailsErrorWidget(
                              errorMessage: state.failure.errorMessage,
                              onRetry: () {
                                BlocProvider.of<OrderDetailsCubit>(context)
                                    .getOrderDetails(orderId: order.id);
                              },
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 48),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
          listener: (context, state) {
            if (state is ConfirmOrderSuccess) {
              CustomAppDialog.showSuccess(
                context: context,
                title: 'Success',
                description: 'Order confirmed successfully!',
              );
            } else if (state is ConfirmOrderError) {
              CustomAppDialog.showError(
                context: context,
                title: 'Error',
                description: state.failure.errorMessage,
              );
            }
          },
          builder: (context, state) {
            if (state is ConfirmOrderLoading) {
              return const SafeArea(
                top: false,
                bottom: true,
                child: SizedBox(
                  height: 70,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              );
            } else {
              if (state is ConfirmOrderSuccess || order.status != 'draft') {
                return const SizedBox.shrink();
              } else {
                return OrderConfirmBottomBar(
                  onConfirm: () {
                    BlocProvider.of<OrderDetailsCubit>(context)
                        .confirmOrder(orderId: order.id);
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
