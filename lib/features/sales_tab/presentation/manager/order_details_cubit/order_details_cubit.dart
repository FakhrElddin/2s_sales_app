import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/use_cases/confirm_order_use_case.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/use_cases/get_order_details_use_case.dart';

part 'order_details_state.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  final ConfirmOrderUseCase confirmOrderUseCase;
  OrderDetailsCubit({
    required this.getOrderDetailsUseCase,
    required this.confirmOrderUseCase,
  }) : super(OrderDetailsInitial());

  void getOrderDetails({required int orderId}) async {
    emit(OrderDetailsLoading());
    var either = await getOrderDetailsUseCase.call(orderId: orderId);
    // if session expired not cuase exception when navigate to login screen
    if (isClosed) return;
    either.fold(
      (failure) => emit(OrderDetailsError(failure: failure)),
      (orderDetails) => emit(OrderDetailsSuccess(orderDetails: orderDetails)),
    );
  }

  void confirmOrder({required int orderId}) async {
    emit(ConfirmOrderLoading());
    var either = await confirmOrderUseCase.call(orderId: orderId);
    either.fold(
      (failure) => emit(ConfirmOrderError(failure: failure)),
      (isConfirmed) => emit(ConfirmOrderSuccess()),
    );
  }
}
