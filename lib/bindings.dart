import 'package:get/get.dart';
import 'package:silent_moon/core/controllers/main_screen_handler.dart';
import 'package:silent_moon/core/controllers/podcasts/newest_podcast_controller.dart';
import 'package:silent_moon/core/network/dio_client.dart';
import 'package:silent_moon/services/dio_api_service.dart';

class MainScreenBindings implements Bindings {

  @override
  void dependencies() {

    // Core
    Get.put<DioClient>(DioClient());

    // Services
    Get.put(
      DioApiService(
        Get.find<DioClient>()
      )
    );

    // Controllers
    Get.put<PodcastController>(
      PodcastController(Get.find<DioApiService>())
    );
    
    Get.put(MainScreenHandler());
  }

}