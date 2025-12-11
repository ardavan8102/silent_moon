import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/controllers/main_screen_handler.dart';

class CustomBottomNavigation extends StatelessWidget {
  CustomBottomNavigation({super.key});

  final MainScreenHandler mainScreenHandler = Get.find<MainScreenHandler>();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff54575C).withValues(alpha: .1),
              offset: Offset(2, -5),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        height: size.height * .12,
        width: double.infinity,
        child: Obx(
          () => Row(
            crossAxisAlignment: .center,
            mainAxisAlignment: .spaceBetween,
            children: [
          
              bottomNavigationIconItem(size, 0, 'خانه', CupertinoIcons.house),
          
              bottomNavigationIconItem(size, 1, 'موسیقی', CupertinoIcons.music_albums),
          
              bottomNavigationIconItem(size, 2, 'خواب', CupertinoIcons.moon),
          
              bottomNavigationIconItem(size, 3, 'مدیتیشن', Icons.mood),

            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationIconItem(Size size, int index, String label, IconData icon) {
    return InkWell(
      onTap: () {
        mainScreenHandler.selectedIndex.value = index;
      },
      child: Column(
        mainAxisAlignment: .center,
        spacing: 8,
        children: [
          // Icon
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              color: mainScreenHandler.selectedIndex.value == index
                ? AppSolidColors.primary
                : Colors.white,
              borderRadius: .circular(16)
            ),
            height: size.height * .05,
            width: size.height * .05,
            child: Icon(
              icon,
              color: mainScreenHandler.selectedIndex.value == index
                ? Colors.white
                : Colors.grey,
              size: 30,
            ),
          ),

          // Label
          Text(
            label,
            style: TextStyle(
              color: mainScreenHandler.selectedIndex.value == index
                ? AppSolidColors.primary
                : Colors.grey,
              fontWeight: mainScreenHandler.selectedIndex.value == index
                ? .bold
                : .w300
            ),
          ),
        ],
      ),
    );
  }
}