import 'package:get/get.dart';
import 'package:silent_moon/controllers/home_controller.dart';

class HomeScreenBindings implements Bindings {

  @override
  void dependencies() {
    Get.put(HomeController());
  }

}