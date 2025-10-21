// import 'package:fashion_store/app/home/views/widgets/craftedCard.dart';
// import 'package:flutter/material.dart';

// class CraftedWithIntentSection extends StatelessWidget {
//   final List<Map<String, dynamic>> craftedItems;

//   const CraftedWithIntentSection({super.key, required this.craftedItems});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             "CRAFTED WITH INTENT",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1.2,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         SizedBox(
//           height: 250,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             itemCount: craftedItems.length,
//             itemBuilder: (context, index) {
//               final item = craftedItems[index];
//               return CraftedCard(item: item);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/craftedCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftedWithIntentSection extends StatelessWidget {
  final String category;
  final String title; // "men" or "women"
  const CraftedWithIntentSection({super.key, required this.category, required this.title});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      final items = category == "men"
          ? controller.menCraftedItems
          : controller.womenCraftedItems;

      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (items.isEmpty) {
        return const SizedBox.shrink();
      }

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
          const SizedBox(height: 12),
      SizedBox(
  height: 300,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.zero, // <— no horizontal padding
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return CraftedCard(item: item);
    },
  ),
),
        ],
      );
    });
  }
}
