import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/repositories/sales_orders_repo.dart';

@injectable
class ConfirmOrderUseCase {
  final SalesOrdersRepo salesOrdersRepo;

  ConfirmOrderUseCase({required this.salesOrdersRepo});

  Future<Either<Failures, bool>> call({required int orderId}) {
    return salesOrdersRepo.confirmOrder(orderId: orderId);
  }
}
