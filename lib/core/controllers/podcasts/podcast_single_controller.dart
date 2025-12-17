import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:silent_moon/core/models/single_podcast/single_podcast_result.dart';
import 'package:silent_moon/services/dio_api_service.dart';

class PodcastSingleController extends GetxController {


  final DioApiService api;

  final String slug;

  PodcastSingleController({required this.api, required this.slug});

  final Rxn<SinglePodcastResult> podcast = Rxn<SinglePodcastResult>();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSinglePodcastData();
    debugPrint('🟡 PodcastSingleController onInit CALLED');
  }


  Future<void> fetchSinglePodcastData() async {

    try {
      
      isLoading.value = true;

      final response = await api.getSinglePodcastResult(slug: slug);

      podcast.value = response;

    } catch (e) {

      debugPrint('podcast data error : $e');

    } finally {

      isLoading.value = false;

    }


  }


}