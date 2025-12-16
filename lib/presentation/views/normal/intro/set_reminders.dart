import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/presentation/components/button_full_width.dart';
import 'package:silent_moon/presentation/components/weekday_selector.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/consts/strings.dart';
import 'package:silent_moon/core/routes/routes.dart';

class SetRemindersScreen extends StatelessWidget {
  const SetRemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(24),
          child: Stack(
            children: [
              // Content
              Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(height: size.height * .03),
                  // Title
                  Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.reminderTitleText, style: textTheme.titleLarge),
                      Text(
                        AppStrings.reminderTitleSubText,
                        style: textTheme.titleMedium!.copyWith(
                          color: AppSolidColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppStrings.reminderTitleDescription,
                        style: textTheme.bodySmall!.copyWith(
                          color: Colors.black.withValues(alpha: .5),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                
                  // Time Picker
                  Container(
                    decoration: BoxDecoration(
                      color: AppSolidColors.primary.withValues(alpha: .1),
                      borderRadius: .circular(20),
                    ),
                    height: 200,
                    width: size.width,
                    child: Directionality(
                      textDirection: .ltr,
                      child: CupertinoTimerPicker(
                        mode: .hm,
                        alignment: .center,
                        minuteInterval: 1,
                        backgroundColor: Colors.transparent,
                        onTimerDurationChanged: (value) {
                          debugPrint('Time : ${value.inHours} : ${value.inMinutes.remainder(60)}');
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // title weekday
                  Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.weekdaySelectorTitleText, style: textTheme.titleLarge),
                      Text(
                        AppStrings.weekdaySelectorTitleSubText,
                        style: textTheme.titleMedium!.copyWith(
                          color: AppSolidColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppStrings.weekdaySelectorTitleDescription,
                        style: textTheme.bodySmall!.copyWith(
                          color: Colors.black.withValues(alpha: .5),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Weekday Selector
                  SizedBox(
                    width: size.width,
                    height: 50,
                    child: WeekdaySelector()
                  ),
                ],
              ),
            
              // Button
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ButtonFullWidth(
                  msg: 'ذخیره',
                  bgcolor: AppSolidColors.primary,
                  function: (){
                    Get.offAllNamed(AppRoutes.home);
                  },
                  textColor: AppSolidColors.lightText
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}