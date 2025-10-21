
import 'package:flutter/material.dart';

class CraftedCard extends StatelessWidget {

  final Map<String, dynamic> item;

  const CraftedCard({super.key, required this.item,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          item["image"] ?? "",
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[300],
            child: const Icon(Icons.image, size: 50),
          ),
        ),
      ),
    );
  }
}
