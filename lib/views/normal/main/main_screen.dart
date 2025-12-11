import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/components/bottom_navigation.dart';
import 'package:silent_moon/controllers/main_screen_handler.dart';
import 'package:silent_moon/views/normal/main/home.dart';
import 'package:silent_moon/views/normal/main/meditations.dart';
import 'package:silent_moon/views/normal/main/music_albums.dart';
import 'package:silent_moon/views/sleep/sleep_home.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainScreenHandler mainScreenHandler = Get.find<MainScreenHandler>();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    List<Widget> pages = [
      
      HomePage(),

      MusicAlbumsPage(),

      SleepHomePage(),

      MeditationsPage(),

    ];

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              // Contents
              Positioned.fill(
                child: Obx(
                  () => Padding(
                    padding: EdgeInsets.fromLTRB(24, 24, 24, size.height * .12),
                    child: IndexedStack(
                      index: mainScreenHandler.selectedIndex.value,
                      children: pages,
                    ),
                  ),
                ),
              ),

              // Bottom Navigation
              CustomBottomNavigation(),
            ],
          ),
        )
      ),
    );
  }
}