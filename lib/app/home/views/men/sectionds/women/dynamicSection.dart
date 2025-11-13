// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DynamicSections extends StatelessWidget {
//   final String title;
//   final RxList<dynamic> sectionData; // 👈 pass your list here

//   const DynamicSections({
//     super.key,
//     required this.title,
//     required this.sectionData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (sectionData.isEmpty) {
//         return const SizedBox.shrink();
//       }

//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1.2,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           SizedBox(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: sectionData.length,
//               itemBuilder: (context, index) {
//                 final merch = sectionData[index];
//                 return Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   width: 160,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.network(
//                       merch["image"] ?? "",
//                       fit: BoxFit.cover,
//                       errorBuilder: (_, __, ___) =>
//                           const Center(child: Icon(Icons.image_not_supported)),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicSections extends StatelessWidget {
  final String title;
  final RxList<dynamic> sectionData; // your list

  const DynamicSections({
    super.key,
    required this.title,
    required this.sectionData,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (sectionData.isEmpty) {
        return const SizedBox.shrink();
      }

      final merch = sectionData.first; // show first item like trending

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
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

          // Big image like Trending Merch
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  merch["image"] ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Center(child: Icon(Icons.image_not_supported, size: 40)),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
