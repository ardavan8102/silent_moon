import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';

class ChooseTopicScreen extends StatelessWidget {
  const ChooseTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: size.height * .03),
              // Titles
              Column(
                spacing: 8,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'چه چیـزی شمــارو به',
                    style: textTheme.titleLarge,
                  ),

                  Text(
                    'مـاهِــ آرامــ رسونده؟',
                    style: textTheme.titleMedium!.copyWith(
                      color: AppSolidColors.primary,
                      fontWeight: .w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'عناوین موردعلاقتون رو انتخاب کنید',
                    style: textTheme.bodySmall!.copyWith(
                      color: Colors.black.withValues(alpha: .5),
                      fontSize: 16
                    ),
                  ),
                ],
              ),
            
              // Grid View
            ],
          ),
        ),
      ),
    );
  }
}