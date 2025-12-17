import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:silent_moon/core/models/podcast_list_models/podcast_response.dart';
import 'package:silent_moon/core/models/single_podcast/single_podcast_result.dart';
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


  // single podcast data
  Future<SinglePodcastResult> getSinglePodcastResult({String? slug}) async {

    debugPrint('✅ getSinglePodcastResult CALLED');

    final response = await dio.dio.get(
      '${ApiEndpoints.getSinglePodcastInfo}$slug',
    );

    final Map<String, dynamic> result = response.data['data']['result'][0];

    return SinglePodcastResult.fromJson(result);

  }


  // get podcast episodes through RSS
  Future<String> fetchPodcastEpisodesRSS(String url) async {

    final response = await dio.dio.get(
      url,
      options: Options(
        responseType: .plain
      )
    );

    return response.data;

  }


}