import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/api/api_manager.dart';
import 'package:twos_home_wear_app/core/api/end_points.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/customers_tab/data/models/customer_model.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/data_sources/customers_remote_data_soucre.dart';
import 'package:twos_home_wear_app/features/customers_tab/domain/entities/customer_entity.dart';

@Injectable(as: CustomersRemoteDataSoucre)
class CustomersRemoteDataSourceImpl implements CustomersRemoteDataSoucre {
  final ApiManager apiManager;

  CustomersRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, List<CustomerEntity>>> getCustomers({
    String? search,
  }) async {
    try {
      List<dynamic> searchFilters = [
        ["customer_rank", ">", 0],
      ];
      if (search != null && search.trim().isNotEmpty) {
        searchFilters.add(["name", "ilike", search.trim()]);
      }
      var response = await apiManager.postData(
        endPoint: EndPoints.getCustomersEndPoint,
        data: {
          'jsonrpc': '2.0',
          'method': 'call',
          'params': {
            "model": "res.partner",
            "method": "search_read",
            "args": [searchFilters],
            "kwargs": {
              "fields": ["id", "name", "phone", "city", "email", "street"],
              "limit": 50,
            },
          },
        },
      );
      if (response.data['result'] != null) {
        List<CustomerEntity> customers = [];
        for (var customer in response.data['result']) {
          CustomerModel customerModel = CustomerModel.fromJson(customer);
          customers.add(customerModel);
        }
        return Right(customers);
      } else if (response.data['error'] != null) {
        return Left(
          UnexpectedError(
            errorMessage:
                response.data['error']['message'] ??
                'Failed to get customers, please try again',
          ),
        );
      } else {
        return Left(
          UnexpectedError(
            errorMessage: 'Failed to get customers, please try again',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ServerError.fromDioException(e));
    } catch (e) {
      return Left(
        UnexpectedError(
          errorMessage: 'Failed to get customers, please try again',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, bool>> updateCustomerPhone({
    required int customerId,
    required String phone,
  }) async {
    try {
      var response = await apiManager.postData(
        endPoint: EndPoints.getCustomersEndPoint,
        data: {
          'jsonrpc': '2.0',
          'method': 'call',
          'params': {
            "model": "res.partner",
            "method": "write",
            "args": [
              [customerId],
              {"phone": phone},
            ],
            "kwargs": {},
          },
        },
      );
      if (response.data['result'] != null) {
        final bool isUpdated = response.data['result'];
        return Right(isUpdated);
      } else if (response.data['error'] != null) {
        return Left(
          UnexpectedError(
            errorMessage:
                response.data['error']['message'] ??
                'Failed to get customers, please try again',
          ),
        );
      } else {
        return Left(
          UnexpectedError(
            errorMessage: 'Failed to get customers, please try again',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ServerError.fromDioException(e));
    } catch (e) {
      return Left(
        UnexpectedError(
          errorMessage: 'Failed to get customers, please try again',
        ),
      );
    }
  }
}
