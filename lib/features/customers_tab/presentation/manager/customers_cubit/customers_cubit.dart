import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/use_cases/get_customers_use_case.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/use_cases/update_customer_phone_use_case.dart';

part 'customers_state.dart';

@injectable
class CustomersCubit extends Cubit<CustomersState> {
  final GetCustomersUseCase getCustomersUseCase;
  final UpdateCustomerPhoneUseCase updateCustomerPhoneUseCase;
  CustomersCubit({
    required this.getCustomersUseCase,
    required this.updateCustomerPhoneUseCase,
  }) : super(CustomersInitial());

  void getCustomers({String? search}) async {
    emit(CustomersLoading());
    var either = await getCustomersUseCase.call(search: search);
    // if session expired not cuase exception when navigate to login screen
    if (isClosed) return;
    either.fold(
      (failure) => emit(CustomersError(failure: failure)),
      (customers) => emit(CustomersSuccess(customers: customers)),
    );
  }

  void updateUserPhone({required int customerId, required String phone}) async {
    emit(UpdateCustomerPhoneLoading());
    var either = await updateCustomerPhoneUseCase.call(
      customerId: customerId,
      phone: phone,
    );
    either.fold((failure) => emit(UpdateCustomerPhoneError(failure: failure)), (
      isUpdated,
    ) async {
      emit(UpdateCustomerPhoneSuccess());
      getCustomers();
    });
  }
}
