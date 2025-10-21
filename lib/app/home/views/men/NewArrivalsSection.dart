import 'package:fashion_store/app/home/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrivalsSection extends StatelessWidget {
  final String title;
  final RxList newArrivals;
   final RxInt currentPage;

   NewArrivalsSection({
    super.key,
    required this.title,
    required this.newArrivals,
  RxInt? currentPage,
  }) : currentPage = currentPage ?? 0.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (newArrivals.isEmpty) return const SizedBox.shrink();

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
              itemCount: newArrivals.length,
              itemBuilder: (context, index) {
                final product = newArrivals[index];
                return ProductCard(product: product);
              },
            ),
          ),
           const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              newArrivals.length,
              (index) => Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: currentPage.value == index ? 10 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: currentPage.value == index
                        ? Colors.black
                        : Colors.grey[400],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    });
  }
}
