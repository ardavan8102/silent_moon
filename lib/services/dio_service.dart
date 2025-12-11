import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!.toString(),
      headers: {
        'X-ListenAPI-Key' : dotenv.env['API_KEY'].toString()
      },
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      method: 'GET'
    )
  );

  Future<Map<String, dynamic>> searchPodcasts(String query) async {
    try {
      final response = await dio.get(
        '/search',
        queryParameters: {
          'q' : query,
        },
      );

      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error: ${e.response?.data}');
      }
      return {"error": e.message};
    }
  }

}