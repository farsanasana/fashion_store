
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/product_card2.dart';

class Sneakersdynamicsection extends StatelessWidget {
  
  final String title;

  const Sneakersdynamicsection({
    super.key,
    required this.title,
  
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final lowerTitle = title.toLowerCase();

    return Obx(() {
      // Check if sections map is empty
      if (controller.sectioning.isEmpty) {
        return const SizedBox.shrink();
      }

      final RxList<dynamic>? selectedList = controller.sectioning[lowerTitle];

      // Debug print to see what's happening
      print('Looking for section: $lowerTitle');
      print('Available sections: ${controller.sectioning.keys}');
      print('Selected list: ${selectedList?.length ?? 0} items');

      if (selectedList == null) {
        print('Section not found: $lowerTitle');
        return const SizedBox.shrink();
      }

      if (selectedList.isEmpty) {
        print('Section is empty: $lowerTitle');
        return const SizedBox.shrink();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 330,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: selectedList.length,
              itemBuilder: (context, index) {
                final product = selectedList[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: ProductCard2(product: product),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}