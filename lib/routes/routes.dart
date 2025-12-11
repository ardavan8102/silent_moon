import 'package:get/get.dart';
import 'package:silent_moon/bindings.dart';
import 'package:silent_moon/views/normal/intro/choose_topic.dart';
import 'package:silent_moon/views/normal/intro/set_reminders.dart';
import 'package:silent_moon/views/normal/intro/welcome.dart';
import 'package:silent_moon/views/normal/main/main_screen.dart';
import 'package:silent_moon/views/sleep/sleep_home.dart';

class AppRoutes {

  static const welcome = '/';
  static const sleep = '/sleep';
  static const chooseTopic = '/choose-topic';
  static const setReminders = '/set-reminders';
  static const home = '/home';

}


class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.welcome,
      page: () => WelcomeScreen()
    ),

    GetPage(
      name: AppRoutes.sleep,
      page: () => SleepHomePage()
    ),

    GetPage(
      name: AppRoutes.chooseTopic,
      page: () => ChooseTopicScreen()
    ),

    GetPage(
      name: AppRoutes.setReminders,
      page: () => SetRemindersScreen()
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => MainScreen(),
      binding: MainScreenBindings(),
    ),

  ];

}