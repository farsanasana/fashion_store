import 'package:fashion_store/app/home/views/widgets/product_card2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FitForAllSection extends StatelessWidget {
  final String title;
  final RxList fitForAll;

  const FitForAllSection({
    super.key,
    required this.title,
    required this.fitForAll,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (fitForAll.isEmpty) return const SizedBox.shrink();

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
          const SizedBox(height: 16),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: fitForAll.length,
              itemBuilder: (context, index) {
                final product = fitForAll[index];
                return ProductCard2(product: product);
              },
            ),
          ),
        ],
      );
    });
  }
}
