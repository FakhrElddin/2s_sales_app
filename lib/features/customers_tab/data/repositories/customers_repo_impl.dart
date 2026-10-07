import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/data_sources/customers_remote_data_soucre.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/repositories/customers_repo.dart';

class CustomersRepoImpl implements CustomersRepo {
  final CustomersRemoteDataSoucre customersRemoteDataSoucre;

  CustomersRepoImpl({required this.customersRemoteDataSoucre});
  @override
  Future<Either<Failures, List<CustomerEntity>>> getCustomers({
    String? search,
  }) async {
    var either = await customersRemoteDataSoucre.getCustomers(search: search);
    return either.fold(
      (failure) => Left(failure),
      (customers) => Right(customers),
    );
  }
}
