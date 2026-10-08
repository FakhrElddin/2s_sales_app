part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsLoading extends OrderDetailsState {}

final class OrderDetailsSuccess extends OrderDetailsState {
  final List<OrderDetailsEntity> orderDetails;

  OrderDetailsSuccess({required this.orderDetails});
}

final class OrderDetailsError extends OrderDetailsState {
  final Failures failure;

  OrderDetailsError({required this.failure});
}
