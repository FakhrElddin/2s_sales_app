import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/use_cases/get_order_details_use_case.dart';

part 'order_details_state.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  OrderDetailsCubit({required this.getOrderDetailsUseCase})
    : super(OrderDetailsInitial());

  void getOrderDetails({required int orderId}) async {
    emit(OrderDetailsLoading());
    var either = await getOrderDetailsUseCase.call(orderId: orderId);
    either.fold(
      (failure) => emit(OrderDetailsError(failure: failure)),
      (orderDetails) => emit(OrderDetailsSuccess(orderDetails: orderDetails)),
    );
  }
}
