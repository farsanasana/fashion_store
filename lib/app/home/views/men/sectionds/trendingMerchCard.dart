import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingMerchSection extends StatelessWidget {
  final String category; // "men" or "women"
  final String title;    // "Trending Merch" or "Curated for You"

  const TrendingMerchSection({
    super.key,
    required this.category,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      List<Map<String, dynamic>> merchList = [];

      // Choose which list to show
      if (title.toLowerCase().contains("curated")) {
        merchList = category == "men"
            ? controller.menCuratedForYou
            : controller.womenCuratedForYou;
      } else {
        merchList = category == "men"
            ? controller.menTrendingMerch
            : controller.womenTrendingMerch;
      }

      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (merchList.isEmpty) {
        return const SizedBox.shrink();
      }

      final merch = merchList.first;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                merch["image"] ?? "",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.image_not_supported, size: 40)),
              ),
            ),
          ),
        ],
      );
    });
  }
}
