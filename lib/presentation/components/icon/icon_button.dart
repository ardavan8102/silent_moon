import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.function,
  });

  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: .circular(100),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
