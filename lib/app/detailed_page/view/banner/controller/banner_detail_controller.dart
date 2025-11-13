// lib/app/banner_detail/controller/banner_detail_controller.dart
import 'package:get/get.dart';
import '../services/banner_detail_service.dart';

class BannerDetailController extends GetxController {
  final service = BannerDetailService();

  var isLoading = true.obs;
  var products = <Map<String, dynamic>>[].obs;
  var banner = {}.obs;

  // Initialize controller with banner data
  void initBanner(Map<String, dynamic> bannerData) {
    banner.value = bannerData;
    fetchBannerProducts(bannerData["id"] ?? "default");
  }

  Future<void> fetchBannerProducts(String bannerId) async {
    isLoading.value = true;
    final result = await service.fetchProducts(bannerId);
    products.assignAll(result);
    isLoading.value = false;
  }
}
