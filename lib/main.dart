import 'package:fashion_store/app/cart/controller/cart-controller.dart';
import 'package:fashion_store/app/cart/view/AddressBookPage.dart';
import 'package:fashion_store/app/cart/view/add_address.dart';
import 'package:fashion_store/app/cart/view/card_payment_page.dart';
import 'package:fashion_store/app/cart/view/net_banking_page.dart';
import 'package:fashion_store/app/cart/view/payment.dart';
import 'package:fashion_store/app/cart/view/payment_success_page.dart';
import 'package:fashion_store/app/cart/view/upi_payment_page.dart';
import 'package:fashion_store/app/splash/view/splas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/home/views/homw_screen.dart';

void main() {


  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController(), permanent: true);
 // Initialize CartController
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash',
    getPages: [

      //GetPage(name: '/cart', page: () => const CartView()),
      GetPage(name: '/splash', page: () => const SplashView()),
      GetPage(name: '/homepage', page: () => const HomeView()),
      //GetPage(name: '/cart', page: () => const CartView()),
          GetPage(name: '/payment', page: () => const PaymentPage()),
    GetPage(name: '/cardPayment', page: () => const CardPaymentPage()),
    GetPage(name: '/upiPayment', page: () => const UpiPaymentPage()),
    GetPage(name: '/netBanking', page: () => const NetBankingPage()),
    GetPage(name: '/paymentSuccess', page: () => const PaymentSuccessPage()),
    GetPage(name: '/addressBook', page: () => const AddressBookPage()),
    GetPage(name: '/addAddress', page: () => const AddAddressPage()),
      


       ],
  ));
}
