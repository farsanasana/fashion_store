import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/SneakerCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SneakersDenSection extends StatelessWidget {
  const SneakersDenSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      if (controller.sneakersDen.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "SNEAKER'S DEN",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 260, // Matches the card height + margin
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.sneakersDen.length,
              itemBuilder: (context, index) {
                final sneaker = controller.sneakersDen[index];
                return SneakerCard(sneaker: sneaker);
              },
            ),
          ),
        ],
      );
    });
  }
}
