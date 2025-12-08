import 'package:get/get.dart';
import 'package:silent_moon/views/normal/welcome.dart';
import 'package:silent_moon/views/sleep/sleep_splash.dart';

class AppRoutes {

  static const welcome = '/';
  static const sleepSplash = '/sleep-splash';

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

  ];

}