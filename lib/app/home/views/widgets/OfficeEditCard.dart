import 'package:fashion_store/app/detailed_page/view/ProductGridPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficialCollabsCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const OfficialCollabsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        Get.to(
          () => ProductGridPage(
            title: product["title"] ?? "Marvel™",
            category: product["category"] ?? "Marvel",
          ),
          transition: Transition.rightToLeft,
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent, // no background
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product["image"] ?? "",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 50),
            ),
          ),
        ),
      ),
    );
  }
}
