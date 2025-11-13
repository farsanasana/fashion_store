import 'package:fashion_store/app/detailed_page/controllers/Product_controller.dart';
import 'package:fashion_store/app/detailed_page/view/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductGridView extends StatelessWidget {
  final bool isMen; // true = men, false = women

  const ProductGridView({super.key, required this.isMen});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductGridController>();

    return Obx(() {
      final products = isMen ? controller.menProducts : controller.womenProducts;

      return GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.58, // taller
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            index: index,
          );
        },
      );
    });
  }
}
