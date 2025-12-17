import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/core/controllers/podcast_single_controller.dart';
import 'package:silent_moon/services/dio_api_service.dart';

class SinglePodcastPage extends StatefulWidget {
  const SinglePodcastPage({super.key, required this.slug});

  final String slug;

  @override
  State<SinglePodcastPage> createState() => _SinglePodcastPageState();
}

class _SinglePodcastPageState extends State<SinglePodcastPage> {

  late final PodcastSingleController podcastSingleController;

  @override
  void initState() {
    super.initState();

    podcastSingleController = Get.put(
      PodcastSingleController(
        api: Get.find<DioApiService>(), 
        slug: widget.slug
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Obx(
            () {
              final podcast = podcastSingleController.podcast.value;
          
              if (podcastSingleController.isLoading.value) {
                return const CircularProgressIndicator();
              }
          
              if (podcast == null) {
                return const Text('No Data Found');
              }
          
              return Center(
                child: Text(
                  podcast.title
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}