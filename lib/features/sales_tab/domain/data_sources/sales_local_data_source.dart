import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';

abstract class SalesLocalDataSource {
  Future<void> saveSalesOrders({required List<SaleOrderEntity> salesOrders});
  Future<Either<Failures, List<SaleOrderEntity>>> getCachedSalesOrders();
  Future<Either<Failures, bool>> confirmOrderLocal({
    required int orderId,
    bool queuePending = true,
  });
  Future<void> saveOrderDetails({
    required int orderId,
    required List<OrderDetailsEntity> orderDetails,
  });
  Future<Either<Failures, List<OrderDetailsEntity>>> getCachedOrderDetails({
    required int orderId,
  });
}
