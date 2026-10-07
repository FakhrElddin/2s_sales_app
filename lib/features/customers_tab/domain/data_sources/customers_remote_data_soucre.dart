import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';

abstract class CustomersRemoteDataSoucre {
  Future<Either<Failures, List<CustomerEntity>>> getCustomers({String? search});
  Future<Either<Failures, bool>> updateCustomerPhone({
    required String customerId,
    required String phone,
  });
}
