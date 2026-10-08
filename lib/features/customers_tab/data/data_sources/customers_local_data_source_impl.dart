import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/data_sources/customers_local_data_source.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';

@Injectable(as: CustomersLocalDataSource)
class CustomersLocalDataSourceImpl implements CustomersLocalDataSource {
  @override
  Future<Either<Failures, List<CustomerEntity>>> getCachedCustomers() async {
    try {
      var box = await Hive.openBox('customers');
      var customersList = box.get('customersList');
      if (customersList != null) {
        var customers = (customersList as List).cast<CustomerEntity>();
        return Right(customers);
      } else {
        return Left(UnexpectedError(errorMessage: 'No cached customers found'));
      }
    } catch (e) {
      return Left(
        UnexpectedError(errorMessage: 'There was an error, ${e.toString()}'),
      );
    }
  }

  @override
  Future<void> saveCustomers({required List<CustomerEntity> customers}) async {
    var box = await Hive.openBox('customers');
    await box.put('customersList', customers);
    await box.close();
  }
}
