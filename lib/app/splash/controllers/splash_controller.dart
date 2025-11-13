
import 'package:get/get.dart';
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // splash duration
    Get.offNamed('/homepage'); // navigate to Home page
  }
}