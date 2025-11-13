import 'package:fashion_store/app/detailed_page/controllers/Product_controller.dart';
import 'package:fashion_store/app/detailed_page/view/SortOption.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';





class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductGridController>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Sort By",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SortOption(label: "Recommended"),
          SortOption(label: "Price: Low to High"),
          SortOption(label: "Price: High to Low"),
          SortOption(label: "Newest First"),
          SortOption(label: "Popularity"),







        ],
      ),
    );
  }
}