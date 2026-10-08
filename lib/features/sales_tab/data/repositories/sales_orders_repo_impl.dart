import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/data_sources/sales_local_data_source.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/data_sources/sales_orders_remote_data_source.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/repositories/sales_orders_repo.dart';

@Injectable(as: SalesOrdersRepo)
class SalesOrdersRepoImpl implements SalesOrdersRepo {
  final SalesOrdersRemoteDataSource salesOrdersRemoteDataSource;
  final SalesLocalDataSource salesLocalDataSource;

  SalesOrdersRepoImpl({
    required this.salesOrdersRemoteDataSource,
    required this.salesLocalDataSource,
  });

  @override
  Future<Either<Failures, List<SaleOrderEntity>>> getSalesOrders() async {
    await _syncPendingConfirmations();
    var either = await salesOrdersRemoteDataSource.getSalesOrders();
    return either.fold(
      (failure) async {
        var localEither = await salesLocalDataSource.getCachedSalesOrders();
        return localEither.fold(
          (localFailure) => Left(failure),
          (cachedOrders) => Right(cachedOrders),
        );
      },
      (salesOrders) async {
        await salesLocalDataSource.saveSalesOrders(salesOrders: salesOrders);
        return Right(salesOrders);
      },
    );
  }

  @override
  Future<Either<Failures, List<OrderDetailsEntity>>> getOrderDetails({
    required int orderId,
  }) async {
    var either = await salesOrdersRemoteDataSource.getOrderDetails(
      orderId: orderId,
    );
    return either.fold(
      (failure) async {
        var localEither = await salesLocalDataSource.getCachedOrderDetails(
          orderId: orderId,
        );
        return localEither.fold(
          (localFailure) => Left(failure),
          (cachedDetails) => Right(cachedDetails),
        );
      },
      (orderDetails) async {
        await salesLocalDataSource.saveOrderDetails(
          orderId: orderId,
          orderDetails: orderDetails,
        );
        return Right(orderDetails);
      },
    );
  }

  @override
  Future<Either<Failures, bool>> confirmOrder({required int orderId}) async {
    var either = await salesOrdersRemoteDataSource.confirmOrder(
      orderId: orderId,
    );
    return either.fold(
      (failure) async {
        var localEither = await salesLocalDataSource.confirmOrderLocal(
          orderId: orderId,
        );
        return localEither.fold(
          (localFailure) => Left(localFailure),
          (isConfirmed) => Right(isConfirmed),
        );
      },
      (isConfirmed) async {
        await salesLocalDataSource.confirmOrderLocal(
          orderId: orderId,
          queuePending: false,
        );
        return Right(isConfirmed);
      },
    );
  }

  Future<void> _syncPendingConfirmations() async {
    try {
      var pendingBox = await Hive.openBox('pending_confirm_orders');
      if (pendingBox.isEmpty) return;
      final pendingOrders = Map<dynamic, dynamic>.from(pendingBox.toMap());
      for (var entry in pendingOrders.entries) {
        final int orderId = entry.key as int;
        var result = await salesOrdersRemoteDataSource.confirmOrder(
          orderId: orderId,
        );
        result.fold((failure) {}, (isSynced) async {
          await pendingBox.delete(orderId);
        });
      }
    } catch (_) {}
  }
}
