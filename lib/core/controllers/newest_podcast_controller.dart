import 'package:get/get.dart';
import 'package:silent_moon/core/models/podcasts/podcast_list_models/podcast_result.dart';
import 'package:silent_moon/services/dio_api_service.dart';

class PodcastController extends GetxController {
  
  final DioApiService api;

  PodcastController(this.api);

  RxList<PodcastResponseResult> newestPodcasts = <PodcastResponseResult>[].obs;
  
  RxBool loading = false.obs;

  int page = 1;
  bool hasMore = true;

  @override
  void onInit(){
    super.onInit();
    fetchNewestPodcasts();
  }

  Future<void> fetchNewestPodcasts() async {
    if (!hasMore) return;

    loading.value = true;

    final res = await api.getNewestPodcasts(page: page);

    newestPodcasts.addAll(res.data.result);
    hasMore = newestPodcasts.length < res.data.total;
    page++;

    loading.value = false;
  }
}