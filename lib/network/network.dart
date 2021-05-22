import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class NetWork {
  static Dio get _dio {
    final _dio = Dio(
      BaseOptions(
        baseUrl: 'http://smith-restaurants.com/api/',
        contentType: 'application/json',
        headers: {
          'accept': 'application/json',
        },
        validateStatus: (_) => true,
        followRedirects: false,
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));
    }
    return _dio;
  }

  static Future<Response> get(
    String url, {
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParams,
  }) async {
    return await _dio.get(
      '/$url',
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }

  static Future<Response> post(
    String url, {
    dynamic body,
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParams,
  }) async {
    return await _dio.post(
      '/$url',
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }
}
