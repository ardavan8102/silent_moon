import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';

class AppBarWithReturnIcon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithReturnIcon({
    super.key,
    required this.text,

  });

  final String text;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(text, style: textTheme.titleMedium),
      ),
      automaticallyImplyLeading: false,
      actions: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            decoration: BoxDecoration(
              color: AppSolidColors.primary,
              borderRadius: .circular(8),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
    
        const SizedBox(width: 20),
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(60);
}