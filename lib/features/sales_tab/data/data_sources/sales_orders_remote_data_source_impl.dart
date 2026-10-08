import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/api/api_manager.dart';
import 'package:twos_home_wear_app/core/api/end_points.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/sales_tab/data/models/order_details_model.dart';
import 'package:twos_home_wear_app/features/sales_tab/data/models/sale_order_model.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/data_sources/sales_orders_remote_data_source.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/order_details_entity.dart';
import 'package:twos_home_wear_app/features/sales_tab/domain/entities/sale_order_entity.dart';

@Injectable(as: SalesOrdersRemoteDataSource)
class SalesOrdersRemoteDataSourceImpl implements SalesOrdersRemoteDataSource {
  final ApiManager apiManager;

  SalesOrdersRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, List<SaleOrderEntity>>> getSalesOrders() async {
    try {
      var response = await apiManager.postData(
        endPoint: EndPoints.callKwEndPoint,
        data: {
          "jsonrpc": "2.0",
          "method": "call",
          "params": {
            "model": "sale.order",
            "method": "search_read",
            "args": [[]],
            "kwargs": {
              "fields": [
                "id",
                "name",
                "partner_id",
                "date_order",
                "state",
                "amount_total",
              ],
              "order": "date_order desc",
            },
          },
        },
      );
      if (response.data['result'] != null) {
        List<SaleOrderEntity> salesOrders = [];
        for (var saleOrder in response.data['result']) {
          SaleOrderModel saleOrderModel = SaleOrderModel.fromJson(saleOrder);
          salesOrders.add(saleOrderModel);
        }
        return Right(salesOrders);
      } else if (response.data['error'] != null) {
        return Left(
          UnexpectedError(
            errorMessage:
                response.data['error']['message'] ??
                'Failed to get sales orders, please try again',
          ),
        );
      } else {
        return Left(
          UnexpectedError(
            errorMessage: 'Failed to get sales orders, please try again',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ServerError.fromDioException(e));
    } catch (e) {
      return Left(
        UnexpectedError(
          errorMessage: 'Failed to get sales orders, please try again',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<OrderDetailsEntity>>> getOrderDetails({
    required int orderId,
  }) async {
    try {
      var response = await apiManager.postData(
        endPoint: EndPoints.callKwEndPoint,
        data: {
          "jsonrpc": "2.0",
          "method": "call",
          "params": {
            "model": "sale.order.line",
            "method": "search_read",
            "args": [
              [
                ["order_id", "=", orderId],
              ],
            ],
            "kwargs": {
              "fields": [
                "id",
                "product_id",
                "name",
                "product_uom_qty",
                "price_unit",
                "price_subtotal",
              ],
            },
          },
        },
      );
      if (response.data['result'] != null) {
        List<OrderDetailsEntity> orderDetails = [];
        for (var order in response.data['result']) {
          OrderDetailsModel orderDetailsModel = OrderDetailsModel.fromJson(
            order,
          );
          orderDetails.add(orderDetailsModel);
        }
        return Right(orderDetails);
      } else if (response.data['error'] != null) {
        return Left(
          UnexpectedError(
            errorMessage:
                response.data['error']['message'] ??
                'Failed to get order details, please try again',
          ),
        );
      } else {
        return Left(
          UnexpectedError(
            errorMessage: 'Failed to get order details, please try again',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ServerError.fromDioException(e));
    } catch (e) {
      return Left(
        UnexpectedError(
          errorMessage: 'Failed to get order details, please try again',
        ),
      );
    }
  }
}
