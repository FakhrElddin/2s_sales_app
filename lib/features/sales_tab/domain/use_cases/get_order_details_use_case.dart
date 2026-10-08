import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/repositories/sales_orders_repo.dart';

@injectable
class GetOrderDetailsUseCase {
  final SalesOrdersRepo salesOrdersRepo;

  GetOrderDetailsUseCase({required this.salesOrdersRepo});

  Future<Either<Failures, List<OrderDetailsEntity>>> call({
    required int orderId,
  }) {
    return salesOrdersRepo.getOrderDetails(orderId: orderId);
  }
}
