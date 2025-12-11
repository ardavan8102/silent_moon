import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      headers: {
        'X-ListenAPI-Key' : dotenv.env['API_KEY'],
        'Accept': 'application/json',
      },
    )
  );

}