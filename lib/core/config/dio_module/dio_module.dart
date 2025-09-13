import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../constants/api_constants/constants.dart';


@module
abstract class DioModule {
  @lazySingleton
  Dio dio(@Named('baseurl') String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: 'application/json',
      ),
    );

    // Logging
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
    return dio;
  }
  @Named('baseurl')
  String get baseUrl => ApiConstants.baseurl;
}
