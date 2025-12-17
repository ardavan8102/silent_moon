import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:silent_moon/core/helpers/parse_xml.dart';
import 'package:silent_moon/core/helpers/sort_episodes_by_date.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';
import 'package:silent_moon/core/network/dio_client.dart';
import 'package:silent_moon/services/dio_api_service.dart';

class FetchEpisodesController extends GetxController {

  final String rssUrl;

  FetchEpisodesController(this.rssUrl);

  final episodes = <PodcastEpisode>[].obs;
  final isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchEpisodes();
  }


  Future<void> fetchEpisodes() async {

    try {

      isLoading.value = true;

      final xmlString = await DioApiService(DioClient()).fetchPodcastEpisodesRSS(rssUrl);

      final parsedXML = parsePodcastEpisodes(xmlString);

      parsedXML.sortByDateDesc();

      episodes.assignAll(parsedXML);

      debugPrint('💡 XML : $parsedXML');

    } catch (e) {

      debugPrint('RSS Error : $e');

    } finally {

      isLoading.value = false;

    }

  }

}