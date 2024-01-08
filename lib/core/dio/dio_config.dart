import 'package:dio/dio.dart';
import 'package:flutter_imdb/core/constants/config.dart';

class ApiInterceptor {
  static Dio apiInstance() {
    Dio dio = Dio();
    dio.options.baseUrl = ApiConfig.url;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
    dio.options.headers = {
      'X-RapidAPI-Key': ApiConfig.rapidApiKey,
      'X-RapidAPI-Host': ApiConfig.rapidApiHost,
    };
    return dio;
  }
}
