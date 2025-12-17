import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.function,
    required this.height,
    required this.width,
    required this.iconSize,
  });

  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final Function() function;
  final double height;
  final double width;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: .circular(100),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
