import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/most_loved_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostLovedDesignSection extends StatelessWidget {
  const MostLovedDesignSection({super.key});

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
              "MOST LOVED DESIGN",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: controller.shopForCategories.length,
              itemBuilder: (context, index) {
                final category = controller.shopForCategories[index];
                return MostLovedDesignCard(category: category);
              },
            ),
          ),
        ],
      );
    });
  }
}