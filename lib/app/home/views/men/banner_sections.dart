import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSection extends StatelessWidget {
  final RxList banners;
  final RxInt currentPage;

  BannerSection({
    super.key,
    required this.banners,
    RxInt? currentPage,
  }) : currentPage = currentPage ?? 0.obs;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight = screenHeight * 0.65; // 🔹 70% of total screen height

    if (banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return Obx(() {
      return Column(
        children: [
          SizedBox(
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
                  margin: EdgeInsets.zero,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // ✅ Detect and load network or asset image correctly
                      imagePath.startsWith('http')
                          ? Image.network(
                              imagePath,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
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
                              Colors.black45,
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

          // 🔹 Page indicator
          const SizedBox(height: 8),
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
          const SizedBox(height: 10),
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
        size: 50,
        color: Colors.grey,
      ),
    );
  }
}
