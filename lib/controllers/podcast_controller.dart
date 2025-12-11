import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:silent_moon/models/podcast_model.dart';

class PodcastController extends GetxController {

  final RxList<PodcastModel> podcastsList = <PodcastModel>[].obs;
  
  final RxBool isLoading = true.obs;
  final RxBool isRefreshing = false.obs;

  int offset = 0;
  final int limit = 10;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      headers: {
        'X-ListenAPI-Key': dotenv.env['API_KEY'],
        'Accept': 'application/json',
      },
    ),
  );

  @override
  void onInit() {
    super.onInit();
    loadRelaxingPodcasts();
  }

  Future<void> loadRelaxingPodcasts() async {
    try {
      isLoading.value = true;

      final response = await dio.get(
        '/search',
        queryParameters: {
          'q': 'relaxing',
          'type': 'podcast',
          'offset': offset,
        },
      );

      final List results = response.data['results'];

      final items = results
          .map((json) => PodcastModel.fromJson(json))
          .toList()
          .cast<PodcastModel>();

      podcastsList.assignAll(items);
    } catch (e) {
      print('Error loading podcasts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    try {
      isRefreshing.value = true;
      offset = 0;
      await loadRelaxingPodcasts();
    } finally {
      isRefreshing.value = false;
    }
  }
}