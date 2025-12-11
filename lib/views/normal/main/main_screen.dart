import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/components/bottom_navigation.dart';
import 'package:silent_moon/controllers/main_screen_handler.dart';
import 'package:silent_moon/views/normal/main/home.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainScreenHandler mainScreenHandler = Get.find<MainScreenHandler>();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    List<Widget> pages = [
      KeyedSubtree(key: ValueKey('home'), child: HomePage()),
      KeyedSubtree(key: ValueKey('music'), child: Container(color: Colors.red,child: Center(child: Text('Music')))),
      KeyedSubtree(key: ValueKey('meditate'), child: Center(child: Text('Meditate'))),
      KeyedSubtree(key: ValueKey('sleep'), child: Center(child: Text('Sleep'))),
    ];

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            // Contents
            Positioned.fill(
              child: Obx(
                () => Padding(
                  padding: EdgeInsets.fromLTRB(24, size.height * .05, 24, size.height * .125),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) {
                      final offsetAnimation = Tween<Offset>(
                        begin: Offset(0, 0.2),
                        end: .zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut
                        )
                      );
      
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    child: pages[mainScreenHandler.selectedIndex.value],
                  ),
                ),
              ),
            ),
      
            // Bottom Navigation
            CustomBottomNavigation(),
          ],
        ),
      ),
    );
  }
}