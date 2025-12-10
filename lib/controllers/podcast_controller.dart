import 'package:get/get.dart';
import 'package:silent_moon/data/podcasts.dart';
import 'package:silent_moon/models/podcast_model.dart';

class PodcastController extends GetxController {

  final RxList<PodcastModel> podcastsList = <PodcastModel>[].obs;

  final RxBool isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
    loadPodcastsData();
  }

  Future<void> loadPodcastsData() async {

    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 800)); // Simulate API Call

    final items = PodcastsData.podcasts.map((item){
      return PodcastModel(
        title: item['title'],
        category: item['category'],
        duration: item['duration'],
        imagePath: item['image_path'],
        isPopular: item['is_popular']
      );
    }).toList();

    podcastsList.assignAll(items);

    isLoading.value = false;

  }

  Future<void> refreshData() async {

    await loadPodcastsData();

  }
}