import 'package:flutter/material.dart';


class CustomElevatedButtonWithIcon extends StatelessWidget {
  const CustomElevatedButtonWithIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.foreColor,
    required this.function,
  });

  final String label;
  final IconData icon;
  final Color bgColor;
  final Color foreColor;
  final Function() function;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(bgColor),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: .circular(16)
        ))
      ),
      child: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        spacing: 6,
        children: [
          Icon(
            icon,
            color: foreColor,
            size: 28,
          ),
    
          Text(
            label,
            style: textTheme.labelMedium!.copyWith(
              fontSize: 18,
              color: foreColor,
              height: 3
            ),
          ),
        ],
      ),
    );
  }
}