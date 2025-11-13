// // import 'package:fashion_store/app/home/views/widgets/product_card.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import '../../controller/home_controller.dart';

// // class PackItUp extends StatelessWidget {
// //   const PackItUp({super.key, required RxList officialCollabs});

// //   @override
// //   Widget build(BuildContext context) {
// //     final HomeController controller = Get.find();

// //     return Obx(() {
// //       if (controller.officialCollabs.isEmpty) return const SizedBox.shrink();

// //       return Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 16.0),
// //             child: Text(
// //               "OFFICIAL COLLABS",
// //               style: TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //                 letterSpacing: 1.2,
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 16),
// //           SizedBox(
// //             height: 320,
// //             child: ListView.builder(
// //               scrollDirection: Axis.horizontal,
// //               padding: const EdgeInsets.symmetric(horizontal: 8),
// //               itemCount: controller.officialCollabs.length,
// //               itemBuilder: (context, index) {
// //                 final product = controller.officialCollabs[index];
// //                 return ProductCard(product: product);
// //               },
// //             ),
// //           ),
// //         ],
// //       );
// //     });
// //   }
// // }
// import 'package:fashion_store/app/home/controller/home_controller.dart';
// import 'package:fashion_store/app/home/views/widgets/product_card2.dart';
// import 'package:flutter/material.dart';


// class PackItUp extends StatelessWidget {
//   final HomeController controller;
//   final String title;

//   const PackItUp({super.key, required this.controller, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1.2,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         SizedBox(
//           height: 320,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             itemCount: controller.officialCollabs.length,
//             itemBuilder: (context, index) {
//               final product = controller.officialCollabs[index];
//               return ProductCard2(product: product);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/widgets/product_card2.dart';

class PackItUp extends StatelessWidget {
  final String category;
  final String title;

  const PackItUp({
    super.key,
    required this.category,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final lowerTitle = title.toLowerCase();

    return Obx(() {
      // Check if sections map is empty
      if (controller.sections.isEmpty) {
        return const SizedBox.shrink();
      }

      final RxList<dynamic>? selectedList = controller.sections[lowerTitle];

      // Debug print to see what's happening
      print('Looking for section: $lowerTitle');
      print('Available sections: ${controller.sections.keys}');
      print('Selected list: ${selectedList?.length ?? 0} items');

      if (selectedList == null) {
        print('Section not found: $lowerTitle');
        return const SizedBox.shrink();
      }

      if (selectedList.isEmpty) {
        print('Section is empty: $lowerTitle');
        return const SizedBox.shrink();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 330,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: selectedList.length,
              itemBuilder: (context, index) {
                final product = selectedList[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: ProductCard2(product: product),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}