import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/repositories/sales_oreders_repo.dart';

class GetSalesOrdersUseCase {
  final SalesOredersRepo salesOredersRepo;

  GetSalesOrdersUseCase({required this.salesOredersRepo});

  Future<Either<Failures, List<SaleOrderEntity>>> call() {
    return salesOredersRepo.getSalesOreser();
  }
}
