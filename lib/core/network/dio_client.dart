import 'package:dio/dio.dart';
import 'package:silent_moon/core/network/api_endpoints.dart';

class DioClient {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
      headers: {
        'Content-Type' : 'application/json',
      },
    )
  );

}