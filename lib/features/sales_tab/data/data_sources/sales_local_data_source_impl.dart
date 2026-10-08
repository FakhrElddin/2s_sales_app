import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/data_sources/sales_local_data_source.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';

@Injectable(as: SalesLocalDataSource)
class SalesLocalDataSourceImpl implements SalesLocalDataSource {
  @override
  Future<Either<Failures, List<SaleOrderEntity>>> getCachedSalesOrders() async {
    try {
      var box = await Hive.openBox('sales_orders');
      var salesOrdersList = box.get('salesOrdersList');
      if (salesOrdersList != null) {
        var salesOrders = (salesOrdersList as List).cast<SaleOrderEntity>();
        return Right(salesOrders);
      } else {
        return Left(
          UnexpectedError(errorMessage: 'No cached sales orders found'),
        );
      }
    } catch (e) {
      return Left(
        UnexpectedError(errorMessage: 'There was an error, ${e.toString()}'),
      );
    }
  }

  @override
  Future<void> saveSalesOrders({
    required List<SaleOrderEntity> salesOrders,
  }) async {
    var box = await Hive.openBox('sales_orders');
    await box.put('salesOrdersList', salesOrders);
    await box.close();
  }

  @override
  Future<Either<Failures, bool>> confirmOrderLocal({
    required int orderId,
    bool queuePending = true,
  }) async {
    try {
      var box = await Hive.openBox('sales_orders');
      var salesOrdersList = box.get('salesOrdersList');
      if (salesOrdersList != null) {
        var orders = (salesOrdersList as List).cast<SaleOrderEntity>().toList();
        final index = orders.indexWhere((order) => order.id == orderId);
        if (index != -1) {
          final old = orders[index];
          orders[index] = SaleOrderEntity(
            id: old.id,
            orderNumber: old.orderNumber,
            customerName: old.customerName,
            date: old.date,
            status: 'sale',
            amountTotal: old.amountTotal,
          );
          await box.put('salesOrdersList', orders);
        }
      }
      if (queuePending) {
        var pendingBox = await Hive.openBox('pending_confirm_orders');
        await pendingBox.put(orderId, orderId);
      }
      return const Right(true);
    } catch (e) {
      return Left(
        UnexpectedError(
          errorMessage: 'Failed to confirm order locally: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<void> saveOrderDetails({
    required int orderId,
    required List<OrderDetailsEntity> orderDetails,
  }) async {
    var box = await Hive.openBox('order_details');
    await box.put(orderId.toString(), orderDetails);
    await box.close();
  }

  @override
  Future<Either<Failures, List<OrderDetailsEntity>>> getCachedOrderDetails({
    required int orderId,
  }) async {
    try {
      var box = await Hive.openBox('order_details');
      var details = box.get(orderId.toString());
      if (details != null) {
        var orderDetails = (details as List).cast<OrderDetailsEntity>();
        return Right(orderDetails);
      } else {
        return Left(
          UnexpectedError(errorMessage: 'No cached order details found'),
        );
      }
    } catch (e) {
      return Left(
        UnexpectedError(errorMessage: 'There was an error, ${e.toString()}'),
      );
    }
  }
}
