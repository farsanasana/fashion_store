// lib/app/banner_detail/views/banner_detail_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/banner_detail_controller.dart';

class BannerDetailPage extends StatelessWidget {
  final Map<String, dynamic> banner;

  const BannerDetailPage({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerDetailController());
    controller.initBanner(banner);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          banner["title"] ?? "Shirts",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.shopping_bag_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final bannerData = controller.banner;
        final products = controller.products;

        return Column(
          children: [
            _buildTopBanner(bannerData["image"]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _buildProductCard(product);
                  },
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        );
      }),
    );
  }

  Widget _buildTopBanner(String? imagePath) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          imagePath != null && imagePath.startsWith('http')
              ? Image.network(imagePath, fit: BoxFit.cover)
              : Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.1)),
          const Positioned(
            right: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("THE", style: TextStyle(color: Colors.black87, fontSize: 16)),
                Text(
                  "chill life",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product["image"],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product["tag"] ?? "",
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, size: 20, color: Colors.black54),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          product["name"] ?? "",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          product["category"] ?? "",
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const SizedBox(height: 2),
        Text(
          "₹${product["price"] ?? ""}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _BottomIcon(label: "MENU", icon: Icons.menu),
          _BottomIcon(label: "FILTER", icon: Icons.filter_list),
          _BottomIcon(label: "SORT", icon: Icons.sort),
        ],
      ),
    );
  }
}

class _BottomIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const _BottomIcon({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: Colors.black),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }
}
