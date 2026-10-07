import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/use_cases/get_sales_orders_use_case.dart';

part 'sales_orders_state.dart';

class SalesOrdersCubit extends Cubit<SalesOrdersState> {
  final GetSalesOrdersUseCase getSalesOrdersUseCase;
  SalesOrdersCubit({required this.getSalesOrdersUseCase})
    : super(SalesOrdersInitial());

  void getSalesOrders() async {
    emit(SalesOrdersLoading());
    var either = await getSalesOrdersUseCase.call();
    either.fold(
      (failure) => emit(SalesOrdersError(failure: failure)),
      (salesOrders) => emit(SalesOrdersSuccess(salesOrders: salesOrders)),
    );
  }
}
