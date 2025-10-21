
// import 'package:flutter/material.dart';

// class MarkdownCard extends StatelessWidget {
//   final Map<String, dynamic> product;
//   const MarkdownCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 220,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       child: Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product image with badges
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                   child: Image.network(
//                     product["image"] ?? "",
//                     height: 220,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Container(height: 220, color: Colors.grey[300], child: const Icon(Icons.image, size: 50)),
//                   ),
//                 ),
//                 if (product["badge"] != null)
//                   Positioned(
//                     top: 8,
//                     left: 8,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
//                       child: Text(
//                         product["badge"],
//                         style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 if (product["discount"] != null)
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
//                       child: Text(
//                         product["discount"],
//                         style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             // Product details
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product["name"] ?? "",
//                     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     product["category"] ?? "",
//                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text(
//                         "₹${product["price"]}",
//                         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
//                       ),
//                       if (product["originalPrice"] != null) ...[
//                         const SizedBox(width: 8),
//                         Text(
//                           "₹${product["originalPrice"]}",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         ),
//                       ],
//                     ],
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


//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MarkdownCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const MarkdownCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Product image
            Image.network(
              product["image"] ?? "",
              width: double.infinity,
              height: double.infinity,

              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => 
                  Container(
                    color: Colors.grey[300], 
                    child: const Icon(Icons.image, size: 50)
                  ),
            ),

            // Dark overlay gradient for better text visibility
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
            ),

            // Badge (top-right corner) - CLEARANCE
            if (product["badge"] != null && product["badge"].isNotEmpty)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: product["badge"] == "CLEARANCE" 
                        ? Colors.yellow[700] 
                        : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product["badge"],
                    style: TextStyle(
                      color: product["badge"] == "CLEARANCE" 
                          ? Colors.black 
                          : Colors.black87,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

            // Main title (centered/bottom)
            Positioned(
              bottom: 60,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product["category"]?.toUpperCase() ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.yellow[600],
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),

            // Subtitle at bottom
            if (product["subtitle"] != null && product["subtitle"].isNotEmpty)
              Positioned(
                bottom: 40,
                left: 16,
                right: 16,
                child: Text(
                  product["subtitle"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}