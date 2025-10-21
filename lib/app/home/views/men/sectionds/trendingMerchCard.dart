import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingMerchSection extends StatelessWidget {
  final String category; 
  final String title; // "men" or "women"

  const TrendingMerchSection({
    super.key,
    required this.category, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      final trendingList = category == "men"
          ? controller.menTrendingMerch
          : controller.womenTrendingMerch;

      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (trendingList.isEmpty) {
        return const SizedBox.shrink();
      }

      // Take the first trending merch item (like banner image)
      final merch = trendingList.first;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Full-width image banner (no rounded corners)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AspectRatio(
              aspectRatio: 16 / 9, // Keeps banner proportion
              child: Image.network(
                merch["image"] ?? "",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(Icons.image_not_supported, size: 40),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
