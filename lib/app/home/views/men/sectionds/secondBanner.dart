import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Secondbanner extends StatelessWidget {
  final RxList banners;
  final RxInt currentPage;
  final String? title; // 👈 Optional title

  Secondbanner({
    super.key,
    required this.banners,
    this.title,
    RxInt? currentPage,
  }) : currentPage = currentPage ?? 0.obs;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight = screenHeight * 0.55; // slightly smaller for better fit

    if (banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Optional title
          if (title != null && title!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          // 🔹 Banner carousel with padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0), // small side padding
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4), // rounded edges
              child: SizedBox(
                height: bannerHeight,
                width: screenWidth,
                child: PageView.builder(
                  itemCount: banners.length,
                  controller: PageController(viewportFraction: 1),
                  onPageChanged: (index) => currentPage.value = index,
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    final imagePath = banner["image"] ?? "";

                    return Container(
                      width: screenWidth,
                      color: Colors.grey[200], // fallback color behind image
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // ✅ Load image with perfect fit
                          imagePath.startsWith('http')
                              ? Image.network(
                                  imagePath,
                                  fit: BoxFit.fill,
                                 // fit: BoxFit.cover,
                                  //fit: BoxFit.cover, // fills container perfectly
                                  filterQuality: FilterQuality.high,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      _errorPlaceholder(),
                                )
                              : Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                  errorBuilder: (context, error, stackTrace) =>
                                      _errorPlaceholder(),
                                ),

                          // ✅ Gradient overlay
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black38,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // 🔹 Page indicator
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length,
              (index) => Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: currentPage.value == index ? 10 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: currentPage.value == index
                        ? Colors.black
                        : Colors.grey[400],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
        ],
      );
    });
  }

  // 🔹 Reusable error placeholder widget
  Widget _errorPlaceholder() {
    return Container(
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: const Icon(
        Icons.broken_image,
        size: 40,
        color: Colors.grey,
      ),
    );
  }
}
