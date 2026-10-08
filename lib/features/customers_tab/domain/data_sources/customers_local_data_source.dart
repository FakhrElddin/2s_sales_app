import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';

abstract class CustomersLocalDataSource {
  void saveCustomers({required List<CustomerEntity> customers});
  Future<Either<Failures, List<CustomerEntity>>> getCachedCustomers();
}
