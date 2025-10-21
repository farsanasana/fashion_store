// import 'package:fashion_store/app/home/views/widgets/SupimaCard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/home_controller.dart';

// class IconicSupimaTeesSection extends StatelessWidget {
//   const IconicSupimaTeesSection({super.key, required RxList supimaTees});

//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.find();

//     return Obx(() {
//       if (controller.supimaTees.isEmpty) return const SizedBox.shrink();

//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               "ICONIC SUPIMA TEES ARE BACK",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1.2,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           SizedBox(
//             height: 400,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               itemCount: controller.supimaTees.length,
//               itemBuilder: (context, index) {
//                 final tee = controller.supimaTees[index];
//                 return SupimaCard(tee: tee);
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }
import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class IconicSupimaTeesSection extends StatelessWidget {
  final HomeController controller;

  const IconicSupimaTeesSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "ICONIC SUPIMA TEES ARE BACK",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: controller.supimaTees.length,
            itemBuilder: (context, index) {
              final tee = controller.supimaTees[index];
              return _supimaCard(tee);
            },
          ),
        ),
      ],
    );
  }

  Widget _supimaCard(Map<String, dynamic> tee) {
    return Container(
      width: 340,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.network(
              tee["image"] ?? "",
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  ),
            ),
            if (tee["description"] != null)
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  width: 180,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tee["description"],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
