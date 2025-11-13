import 'package:fashion_store/app/detailed_page/view/banner/views/banner_detailed_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftedCard extends StatelessWidget {

  final Map<String, dynamic> item;

  const CraftedCard({super.key, required this.item,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle card tap if needed
        // TODO: Add navigation to product detail
         Get.to(() => BannerDetailPage( banner: item,));
      },
      child: Container(
        width: 300,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            item["image"] ?? "",
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
