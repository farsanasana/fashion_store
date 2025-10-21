import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/shopforcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopForSection extends StatelessWidget {
  const ShopForSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      if (controller.shopForCategories.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "SHOP FOR",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: controller.shopForCategories.length,
              itemBuilder: (context, index) {
                final category = controller.shopForCategories[index];
                return ShopForCard(category: category);
              },
            ),
          ),
        ],
      );
    });
  }
}