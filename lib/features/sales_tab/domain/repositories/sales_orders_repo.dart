import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';

abstract class SalesOrdersRepo {
  Future<Either<Failures, List<SaleOrderEntity>>> getSalesOrders();
  Future<Either<Failures, List<OrderDetailsEntity>>> getOrderDetails({
    required int orderId,
  });
}
