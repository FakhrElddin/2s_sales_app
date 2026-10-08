import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:twos_home_wear_app/core/api/api_constants.dart';
import 'package:twos_home_wear_app/core/cache/shared_prefs_utils.dart';
import 'package:twos_home_wear_app/core/utils/auth_helper.dart';

@singleton
class ApiManager {
  late final Dio dio;
  final CookieJar cookieJar = CookieJar();

  ApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final sessionId = SharedPrefsUtils.getData(key: 'session_id');
          if (sessionId != null && sessionId.toString().isNotEmpty) {
            options.headers['Cookie'] = 'session_id=$sessionId';
          }
          handler.next(options);
        },
        onResponse: (response, handler) async {
          if (response.statusCode == 401 ||
              (response.data is Map &&
                  response.data['error']?['message']?.toString().contains(
                        'Session Expired',
                      ) ==
                      true)) {
            await AuthHelper.handleSessionExpired();
          }
          handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 ||
              (error.response?.data is Map &&
                  error.response?.data['error']?['message']
                          ?.toString()
                          .contains('Session Expired') ==
                      true)) {
            await AuthHelper.handleSessionExpired();
          }
          handler.next(error);
        },
      ),
    );
    // print request in console (for testing)
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> deleteData({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> putData({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.put(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> patchData({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.patch(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }
}
