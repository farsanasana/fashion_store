// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final Map<String, dynamic> product;

//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 2,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.network(
//                 product["image"] ?? "",
//                 height: 160,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//                 errorBuilder: (_, __, ___) => Container(
//                   height: 160,
//                   color: Colors.grey[300],
//                   child: const Icon(Icons.image, size: 50),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product["name"] ?? "",
//                     style: const TextStyle(
//                         fontSize: 14, fontWeight: FontWeight.w600),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     "₹${product["price"]}",
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image with badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.network(
                  product["image"] ?? "",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  ),
                ),
               ),
              // if (product["badge"] != null)
              //   Positioned(
              //     top: 8,
              //     left: 8,
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 8,
              //         vertical: 4,
              //       ),
              //       decoration: BoxDecoration(
              //         color: Colors.black87,
              //         borderRadius: BorderRadius.circular(4),
              //       ),
              //       child: Text(
              //         product["badge"],
              //         style: const TextStyle(
              //           color: Colors.white,
              //           fontSize: 10,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
      
          // Product Details
             // Product Details — no card, no background
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product["name"] ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 56, 53, 53),
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 1),
                Text(
                  product["category"] ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  "₹${product["price"]}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 1),
                    Text(
                  "Price inclusive of all taxes",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
