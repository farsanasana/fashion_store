
// import 'package:fashion_store/app/home/controller/home_controller.dart';
// import 'package:fashion_store/app/home/views/widgets/markdown_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MarkdownsSection extends StatelessWidget {
//   const MarkdownsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.find();

//     return Obx(() {
//       if (controller.markdowns.isEmpty) return const SizedBox.shrink();

//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               "MARKDOWNS",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1.2,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           SizedBox(
//             height: 350,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               itemCount: controller.markdowns.length,
//               itemBuilder: (context, index) {
//                 final product = controller.markdowns[index];
//                 return MarkdownCard(product: product);
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/markdown_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarkdownsSection extends StatelessWidget {
  const MarkdownsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      if (controller.markdowns.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "MARKDOWNS",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: Colors.black87,
                  ),
                ),
                // Optional: View All button
                if (controller.markdowns.length > 3)
                  TextButton(
                    onPressed: () {
                      // Navigate to all markdowns page
                      // Get.toNamed(Routes.MARKDOWNS);
                    },
                    child: const Text(
                      "VIEW ALL",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          
          // Horizontal Scrolling Cards
          SizedBox(
            height: 300, // Increased height for better card display
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              physics: const BouncingScrollPhysics(),
              itemCount: controller.markdowns.length,
              itemBuilder: (context, index) {
                final product = controller.markdowns[index];
                return MarkdownCard(product: product);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}