import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FandomHiddenGemsSection extends StatelessWidget {
  const FandomHiddenGemsSection({super.key, required RxList fandomHiddenGems});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      if (controller.fandomHiddenGems.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "FANDOM HIDDEN GEMS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: controller.fandomHiddenGems.length,
              itemBuilder: (context, index) {
                final product = controller.fandomHiddenGems[index];
                return ProductCard(product: product); // reuse ProductCard
              },
            ),
          ),
        ],
      );
    });
  }
}
