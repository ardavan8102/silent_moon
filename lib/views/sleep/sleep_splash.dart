import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/consts/strings.dart';
import 'package:silent_moon/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 400), (){
      setState(() {
        _opacity = 1;
      });
    });

    // hide mobile's bottom navbar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // Navigate
    // TODO : Must navigate to sleep screen
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppSolidColors.darkBackground,
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 4),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.splashBackground.path),
              fit: BoxFit.cover
            )
          ),
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: .center,
            children: [
              // Text
              Positioned(
                left: 0,
                right: 0,
                top: 130,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: Column(
                    children: [
                      Text(
                        AppStrings.titleText,
                        style: textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        AppStrings.titleSubText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Dana',
                        ),
                        textAlign: .center,
                      )
                    ],
                  ),
                ),
              ),

              // Image
              Positioned(
                left: 0,
                right: -size.height * .1,
                top: size.height * .35,
                child: Image.asset(Assets.images.birds.path),
              ),
        
              // Button
              Positioned(
                left: 24,
                right: 24,
                bottom: 100,
                child: SizedBox(
                  height: size.height * .08,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(AppSolidColors.primary),
                    ),
                    child: Text(
                      'همین حالا شروع کنید',
                      style: textTheme.labelLarge!.copyWith(
                        color: Colors.white
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}