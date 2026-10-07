import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/repositories/customers_repo.dart';

class UpdateCustomerPhoneUseCase {
  final CustomersRepo customersRepo;

  UpdateCustomerPhoneUseCase({required this.customersRepo});

  Future<Either<Failures, bool>> call({
    required String customerId,
    required String phone,
  }) {
    return customersRepo.updateCustomerPhone(
      customerId: customerId,
      phone: phone,
    );
  }
}
