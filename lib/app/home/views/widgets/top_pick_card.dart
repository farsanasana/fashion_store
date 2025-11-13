import 'package:fashion_store/app/detailed_page/view/product_detailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TopPickCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int rank;

  const TopPickCard({
    super.key,
    required this.product,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.42;

    return GestureDetector(
      onTap: () {
        // TODO: Add navigation to product detail
        // Handle product tap if needed
            Get.to(() => ProductDetailPage(product: product));
      },
      child: Container(
        width: cardWidth,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Product Image + Rank Overlay ---
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product["image"] ?? "",
                    height: 200, // reduced from 220
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 40, color: Colors.grey),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Text(
                    rank.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.4),
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 8),
      
            // --- Product Details ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["name"] ?? "",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    product["category"] ?? "",
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "₹${product["price"]}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Incl. of all taxes",
                    style: TextStyle(fontSize: 9, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
