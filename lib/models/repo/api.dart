import 'package:dio/dio.dart';

class Api {
  static final String _apiKey = 'fe85fecc7e134922c56b6ca7f8917afb';

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': _apiKey,
      },
    ),
  );

  Dio get sendResponse => _dio;
}
