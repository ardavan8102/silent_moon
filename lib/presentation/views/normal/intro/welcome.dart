import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/presentation/components/button_full_width.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/consts/strings.dart';
import 'package:silent_moon/gen/assets.gen.dart';
import 'package:silent_moon/core/routes/routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 400), (){
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppSolidColors.primary,
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 4),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.welcome.path),
              fit: .cover,
            )
          ),
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: .center,
            children: [
              // Texts
              Positioned(
                left: 24,
                right: 24,
                top: 75,
                child: Column(
                  children: [
                    Image.asset(Assets.images.logoText.path),

                    const SizedBox(height: 50),

                    Text(
                      'خیلی خوش آمدید به',
                      style: textTheme.headlineLarge!.copyWith(
                        color: AppSolidColors.lightText,
                      ),
                    ),

                    Text(
                      'Silent Moon',
                      style: textTheme.headlineLarge!.copyWith(
                        color: AppSolidColors.lightText.withValues(alpha: .8),
                        fontSize: 38,
                        wordSpacing: 8
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: size.width * .8,
                      child: Text(
                        'برنامه را کاوش کنید، آرامش خاطر پیدا کنید تا برای مدیتیشن آماده شوید.',
                        textAlign: .center,
                        style: textTheme.bodySmall!.copyWith(
                          color: AppSolidColors.lightText.withValues(alpha: .7),
                          fontSize: 18,
                        )
                      ),
                    ),
                  ],
                ),
              ),

              // Image
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(Assets.images.meditation.path)
              ),


              // Button
              Positioned(
                left: 24,
                right: 24,
                bottom: 100,
                child: ButtonFullWidth(
                  msg: AppStrings.getStartButtonText,
                  bgcolor: AppSolidColors.lightButtonBackGround,
                  function: (){
                    Get.offAndToNamed(AppRoutes.chooseTopic);
                  },
                  textColor: AppSolidColors.darkText
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}