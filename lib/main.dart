import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:markat_store/Screens/Splash/splash_screen.dart';
import 'package:markat_store/getx/language_controller.dart';

import 'Shared preferences/shared_preferences.dart';
import 'getx/address_getx_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await AppSettingsPreferences().intiPreferences();
  Get.put(LanguageController());
  Get.put(CategoriesGetxController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          locale: Locale("en"),
          home: const SplashScreen(),
        );
      },
    );
  }
}
