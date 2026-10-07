import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/api/api_manager.dart';
import 'package:twos_home_wear_app/core/api/end_points.dart';
import 'package:twos_home_wear_app/core/cache/shared_prefs_utils.dart';
import 'package:twos_home_wear_app/core/errors/failures.dart';
import 'package:twos_home_wear_app/features/login/data/models/login_model.dart';
import 'package:twos_home_wear_app/features/login/domain/data_sources/login_remote_data_source.dart';
import 'package:twos_home_wear_app/features/login/domain/entities/login_entity.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiManager apiManager;

  LoginRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiManager.postData(
        endPoint: EndPoints.loginEndPoint,
        data: {
          'jsonrpc': '2.0',
          'params': {'db': 'fakhr-sales', 'login': email, 'password': password},
        },
      );
      if (response.data['result'] != null) {
        LoginModel loginModel = LoginModel.fromJson(response.data);
        await SharedPrefsUtils.saveData(key: 'is_internal_user',value: loginModel.isInternalUser ?? false);
        await SharedPrefsUtils.saveData(key: 'user_name',value: loginModel.name ?? '');
        return Right(loginModel);
      } else if (response.data['error'] != null) {
        return Left(
          UnexpectedError(
            errorMessage:
                response.data['error']['message'] ??
                'Failed to login, please try again',
          ),
        );
      } else {
        return Left(
          UnexpectedError(errorMessage: 'Failed to login, please try again'),
        );
      }
    } on DioException catch (e) {
      return Left(ServerError.fromDioException(e));
    } catch (e) {
      return Left(
        UnexpectedError(errorMessage: 'Failed to login, please try again'),
      );
    }
  }
}
