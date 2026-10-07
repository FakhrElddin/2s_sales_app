import 'package:dartz/dartz.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';

abstract class SalesOredersRepo {
  Future<Either<Failures, List<SaleOrderEntity>>> getSalesOreser();
}
