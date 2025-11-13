import 'package:fashion_store/app/detailed_page/view/product_detailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard2 extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard2({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation to product detail
        // Handle product tap if needed
            Get.to(() => ProductDetailPage(product: product));
      },

      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product["image"] ?? "",
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 230,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 50),
                ),
              ),
            ),
      
            // Product Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product["name"] ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      product["category"] ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "₹${product["price"] ?? ''}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Price inclusive of all taxes",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
