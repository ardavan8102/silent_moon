import 'package:flutter/material.dart';

class ButtonFullWidth extends StatelessWidget {
  final String msg;
  final Color bgcolor;
  final Color textColor;
  final Function() function;
  const ButtonFullWidth({super.key, required this.msg, required this.bgcolor, required this.function, required this.textColor});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    
    return SizedBox(
      height: size.height * .08,
      child: ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(bgcolor),
        ),
        child: Text(
          msg,
          style: textTheme.labelLarge!.copyWith(
            color: textColor
          ),
        ),
      ),
    );
  }
}