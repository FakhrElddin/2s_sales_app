part of 'sales_orders_cubit.dart';

@immutable
sealed class SalesOrdersState {}

final class SalesOrdersInitial extends SalesOrdersState {}

final class SalesOrdersLoading extends SalesOrdersState {}

final class SalesOrdersSuccess extends SalesOrdersState {
  final List<SaleOrderEntity> salesOrders;

  SalesOrdersSuccess({required this.salesOrders});
}

final class SalesOrdersError extends SalesOrdersState {
  final Failures failure;

  SalesOrdersError({required this.failure});
}
