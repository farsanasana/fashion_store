import 'package:fashion_store/app/splash/view/splas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/home/views/homw_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash',
    getPages: [

      //GetPage(name: '/cart', page: () => const CartView()),
      GetPage(name: '/splash', page: () => const SplashView()),
      GetPage(name: '/home', page: () => const HomeView()),
      //GetPage(name: '/cart', page: () => const CartView()),
      


       ],
  ));
}
