import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {

  static String baseUrl = dotenv.env['BASE_URL']!;

  static const String getPodcastsList = 'flex/list/channel'; // ?&page=1&limit=12 -> newest || ?categoryId=640&page=1&limit=12 -> cat id
  static const String getSinglePodcastInfo = 'podcast/v1/client/podcast/slug'; // slug-id

}