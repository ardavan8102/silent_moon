import 'package:get/get.dart';

class MainScreenHandler extends GetxController {

  RxInt selectedIndex = 0.obs;

  void changeIndex(int index){
    selectedIndex.value = index;
  }

}