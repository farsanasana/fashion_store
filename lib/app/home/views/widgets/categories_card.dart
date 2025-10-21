import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation to category detail
        //

        
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // 🟢 removed white background
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.2),
            //   spreadRadius: 1,
            //   blurRadius: 4,
            //   offset: const Offset(0, 2),
            // ),

          // ],       
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Image
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  category["image"] ?? "",
                  width: double.infinity,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.category, size: 50),
                  ),
                ),
              ),
            ),
            // Category Name — on transparent background
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0, left: 4, right: 4),
            //   child: Text(
            //     category["name"] ?? "",
            //     style: const TextStyle(
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold,
            //       letterSpacing: 0.5,
            //     ),
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
