import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/OfficeEditCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficialCollabsSection extends StatelessWidget {
  const OfficialCollabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      if (controller.officialCollabs.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "OFFICIAL COLLABS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
  height: 280,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    itemCount: controller.officialCollabs.length,
    itemBuilder: (context, index) {
      final product = controller.officialCollabs[index];
      return Padding(
        padding: EdgeInsets.only(right: index == controller.officialCollabs.length - 1 ? 0 : 50),
        child: OfficialCollabsCard(product: product),
      );
    },
  ),
),
        ],
      );
    });
  }
}
