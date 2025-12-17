import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {

  static String baseUrl = dotenv.env['BASE_URL']!;

  static String getPodcastsList = dotenv.env['GET_PODCAST_LIST']!;
  static String getSinglePodcastInfo = dotenv.env['GET_PODCAST_INFO']!;

}