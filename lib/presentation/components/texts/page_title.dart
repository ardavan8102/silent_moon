import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';

class PageTitleWidget extends StatelessWidget {
  const PageTitleWidget({super.key, required this.texts});

  final List<String> texts;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Column(
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: texts[0],
                style: textTheme.titleMedium!.copyWith(
                  fontFamily: 'Plasma',
                  fontSize: 40,
                ),
              ),

              WidgetSpan(child: SizedBox(width: 6)),

              TextSpan(
                text: texts[1],
                style: textTheme.titleMedium!.copyWith(
                  fontFamily: 'Plasma',
                  fontSize: 40,
                  color: AppSolidColors.primary,
                ),
              ),
            ]
          ),
        ),

        Text(
          texts[2],
          style: textTheme.bodySmall!.copyWith(
            color: Colors.black.withValues(alpha: .5),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}