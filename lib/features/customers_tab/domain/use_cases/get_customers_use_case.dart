import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/repositories/customers_repo.dart';

@injectable
class GetCustomersUseCase {
  final CustomersRepo customersRepo;

  GetCustomersUseCase({required this.customersRepo});

  Future<Either<Failures, List<CustomerEntity>>> call({String? search}) {
    return customersRepo.getCustomers(search: search);
  }
}
