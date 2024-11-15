import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/core/utils/colors.dart';
import 'package:login_register/app/modules/views/home_page.dart';
import 'package:login_register/app/modules/views/onboarding.dart';
// ignore: unused_import
import 'package:login_register/app/modules/views/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ColorsController());

  // Cek status login
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  Widget home = isLoggedIn ? HomePage() : OnboardingViews();

  runApp(MyApp(home: home));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final ColorsController colorsController = Get.find<ColorsController>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: colorsController.blueColor),
        useMaterial3: true,
      ),
      home: home,
    );
  }
}
