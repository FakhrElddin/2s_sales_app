import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/data_sources/sales_orders_remote_data_source.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/repositories/sales_orders_repo.dart';

@Injectable(as: SalesOrdersRepo)
class SalesOrdersRepoImpl implements SalesOrdersRepo {
  final SalesOrdersRemoteDataSource salesOrdersRemoteDataSource;

  SalesOrdersRepoImpl({required this.salesOrdersRemoteDataSource});
  @override
  Future<Either<Failures, List<SaleOrderEntity>>> getSalesOrder() async {
    var either = await salesOrdersRemoteDataSource.getSalesOrders();
    return either.fold(
      (failure) => Left(failure),
      (salesOrders) => Right(salesOrders),
    );
  }
}
