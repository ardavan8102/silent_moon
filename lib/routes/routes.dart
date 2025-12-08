import 'package:get/get.dart';
import 'package:silent_moon/views/normal/intro/choose_topic.dart';
import 'package:silent_moon/views/normal/intro/welcome.dart';
import 'package:silent_moon/views/sleep/sleep_splash.dart';

class AppRoutes {

  static const welcome = '/';
  static const sleepSplash = '/sleep-splash';
  static const chooseTopic = '/choose-topic';

}


class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.welcome,
      page: () => WelcomeScreen()
    ),

    GetPage(
      name: AppRoutes.sleepSplash,
      page: () => SplashScreen()
    ),

    GetPage(
      name: AppRoutes.chooseTopic,
      page: () => ChooseTopicScreen()
    ),

  ];

}