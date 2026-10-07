import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/use_cases/get_customers_use_case.dart';

part 'customers_state.dart';

@injectable
class CustomersCubit extends Cubit<CustomersState> {
  final GetCustomersUseCase getCustomersUseCase;
  CustomersCubit({required this.getCustomersUseCase})
    : super(CustomersInitial());

  void getCustomers({String? search}) async {
    emit(CustomersLoading());
    var either = await getCustomersUseCase.call(search: search);
    either.fold(
      (failure) => emit(CustomersError(failure: failure)),
      (customers) => emit(CustomersSuccess(customers: customers)),
    );
  }
}
