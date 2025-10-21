// Splash Screen View
import 'package:fashion_store/app/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // initialize controller
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.red, // red background
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          // your logo here
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}