part of 'customers_cubit.dart';

@immutable
sealed class CustomersState {}

final class CustomersInitial extends CustomersState {}

final class CustomersLoading extends CustomersState {}

final class CustomersSuccess extends CustomersState {
  final List<CustomerEntity> customers;

  CustomersSuccess({required this.customers});
}

final class CustomersError extends CustomersState {
  final Failures failure;

  CustomersError({required this.failure});
}
