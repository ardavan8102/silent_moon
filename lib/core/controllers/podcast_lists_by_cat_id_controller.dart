import 'package:get/get.dart';
import 'package:silent_moon/core/models/podcasts/podcast_list_models/podcast_result.dart';
import 'package:silent_moon/services/dio_api_service.dart';

class PodcastListsByCatIdController extends GetxController {
  
  final DioApiService api;
  final int catId;

  PodcastListsByCatIdController(this.api, this.catId);

  RxList<PodcastResponseResult> podcasts = <PodcastResponseResult>[].obs;
  
  RxBool loading = false.obs;

  int page = 1;
  bool hasMore = true;

  @override
  void onInit(){
    super.onInit();
    fetchPodcastsByCatId();
  }

  Future<void> fetchPodcastsByCatId() async {
    if (!hasMore) return;

    loading.value = true;

    final res = await api.getPodcastsByCatId(page: page, categoryId: catId);

    podcasts.addAll(res.data.result);
    hasMore = podcasts.length < res.data.total;
    page++;

    loading.value = false;
  }
}