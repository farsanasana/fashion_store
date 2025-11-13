import 'package:fashion_store/app/detailed_page/view/banner/views/banner_detailed_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SneakerCard extends StatelessWidget {
  final Map<String, dynamic> sneaker;
  const SneakerCard({super.key, required this.sneaker});

  @override
  Widget build(BuildContext context) {
    




    return GestureDetector(
      onTap: () {
        // Handle card tap if needed
        // TODO: Add navigation to sneaker detail page
         Get.to(() => BannerDetailPage(banner: sneaker));
      },
      child: Container(
        width: 285,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Sneaker Image
              Image.network(
                sneaker["image"] ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 50),
                ),
              ),
      
              // Gradient overlay for better text visibility
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
      
              // Centered Title
              if (sneaker["title"] != null)
                Center(
                  child: Text(
                    sneaker["title"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(color: Colors.black54, blurRadius: 8),
                      ],
                    ),
                  ),
                ),
      
              // Subtitle at Bottom
              if (sneaker["subtitle"] != null)
                Positioned(
                  bottom: 18,
                  left: 0,
                  right: 0,
                  child: Text(
                    sneaker["subtitle"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(color: Colors.black38, blurRadius: 6),
                      ],
                    ),
                  ),
                ),
      
              // Badge at top left
              if (sneaker["badge"] != null)
                Positioned(
                  top: 12,
                  
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      sneaker["badge"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
