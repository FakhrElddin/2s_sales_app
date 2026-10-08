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
        await _cacheData(
          name: loginModel.name ?? '',
          isInternalUser: loginModel.isInternalUser ?? false,
          cookies: response.headers.map['set-cookie'],
        );
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

  String? _getSessionId(List<String>? cookies) {
    if (cookies != null) {
      for (var cookie in cookies) {
        if (cookie.contains('session_id=')) {
          return cookie.split('session_id=')[1].split(';')[0];
        }
      }
    }
    return null;
  }

  Future<void> _cacheData({
    required String name,
    required bool isInternalUser,
    List<String>? cookies,
  }) async {
    String? sessionId = _getSessionId(cookies);
    if (sessionId != null) {
      await SharedPrefsUtils.saveData(key: 'sessionId', value: sessionId);
    }

    await SharedPrefsUtils.saveData(
      key: 'is_internal_user',
      value: isInternalUser,
    );
    await SharedPrefsUtils.saveData(key: 'user_name', value: name);
  }
}
