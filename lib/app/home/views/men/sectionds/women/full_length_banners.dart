
// import 'package:fashion_store/app/home/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FullLengthBanners extends StatelessWidget {
//   final String title;
//    const FullLengthBanners({super.key, required this.title, required RxList onecebannerimages});

//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.find();

//     return Obx(() {
//       if (controller.onecebannerimages.isEmpty) return const SizedBox.shrink();

//       final merch = controller.onecebannerimages.first; // single banner image

//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//            Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1.2,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(5),
//               child: AspectRatio(
//                 aspectRatio: 16 / 9, // maintains banner proportions
//                 child: Image.network(
//                   merch["image"] ?? "",
//                   fit: BoxFit.cover,
//                   errorBuilder: (_, __, ___) => const Center(
//                     child: Icon(Icons.image_not_supported, size: 40),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }

