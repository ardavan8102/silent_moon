import 'package:flutter/material.dart';
import 'package:silent_moon/core/models/podcasts/podcast_list_models/podcast_response.dart';
import 'package:silent_moon/core/network/api_endpoints.dart';
import 'package:silent_moon/core/network/dio_client.dart';

class DioApiService {

  final DioClient dio;

  DioApiService(this.dio);
  
  // get newest podcasts list
  Future<PodcastResponse> getNewestPodcasts({
    int page = 1,
    int limit = 12,
  }) async {

    debugPrint('✅ getNewestPodcasts CALLED');

    final response = await dio.dio.post(
      ApiEndpoints.getPodcastsList,
      queryParameters: {
        'page' : page,
        'limit' : limit,
      }
    );

    return PodcastResponse.fromJson(response.data);
  }

  // get podcasts by category id
  Future<PodcastResponse> getPodcastsByCatId({
    int categoryId = 640,
    int page = 1,
    int limit = 12,
  }) async {


    debugPrint('✅ getPodcastsByCatId CALLED');

    final reponse = await dio.dio.post(
      ApiEndpoints.getPodcastsList,
      queryParameters: {
        'categoryId' : categoryId,
        'page' : page,
        'limit' : limit,
      }
    );

    return PodcastResponse.fromJson(reponse.data);

  }

}