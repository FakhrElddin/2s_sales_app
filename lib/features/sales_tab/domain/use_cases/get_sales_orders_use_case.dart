import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/repositories/sales_orders_repo.dart';

@injectable
class GetSalesOrdersUseCase {
  final SalesOrdersRepo salesOredersRepo;

  GetSalesOrdersUseCase({required this.salesOredersRepo});

  Future<Either<Failures, List<SaleOrderEntity>>> call() {
    return salesOredersRepo.getSalesOrder();
  }
}
