import 'package:get/get.dart';
import 'package:silent_moon/bindings.dart';
import 'package:silent_moon/presentation/views/intro/choose_topic.dart';
import 'package:silent_moon/presentation/views/intro/set_reminders.dart';
import 'package:silent_moon/presentation/views/intro/welcome.dart';
import 'package:silent_moon/presentation/views/main/audio_player_page.dart';
import 'package:silent_moon/presentation/views/main/main_screen.dart';
import 'package:silent_moon/presentation/views/main/music_albums.dart';

class AppRoutes {

  static const welcome = '/';
  static const chooseTopic = '/choose-topic';
  static const setReminders = '/set-reminders';
  static const home = '/home';
  static const musicsAlbum = '/album';
  static const podcastSingle = '/podcast-single';
  static const audioPlayer = '/audio-player';

}


class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.welcome,
      page: () => WelcomeScreen()
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

    GetPage(
      name: AppRoutes.musicsAlbum,
      page: () => MusicAlbumsPage(),
    ),

    GetPage(
      name: AppRoutes.audioPlayer,
      page: () => AudioPlayerPage(),
    ),


  ];

}