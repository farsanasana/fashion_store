

import 'package:flutter/material.dart';

class MostLovedDesignCard extends StatelessWidget {
  final Map<String, dynamic> category;
  const MostLovedDesignCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [

            // Background image
            Image.network(
              category["image"] ?? "",
              
              width: double.infinity,
              height: 450,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.grey[300], child: const Icon(Icons.image, size: 50)),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Category text
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Text(
                category["title"] ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
