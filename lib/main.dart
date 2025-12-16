import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:silent_moon/core/routes/routes.dart';
import 'package:silent_moon/core/styles/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide mobile's bottom navbar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await dotenv.load(fileName: '.env');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silent Moon',

      locale: Locale('fa', 'IR'),

      theme: AppTheme.mainTheme,

      //initialRoute: AppRoutes.welcome,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}