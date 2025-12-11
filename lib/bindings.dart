import 'package:get/get.dart';
import 'package:silent_moon/controllers/home_controller.dart';
import 'package:silent_moon/controllers/main_screen_handler.dart';
import 'package:silent_moon/controllers/podcast_controller.dart';

class MainScreenBindings implements Bindings {

  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(PodcastController());
    Get.put(MainScreenHandler());
  }

}