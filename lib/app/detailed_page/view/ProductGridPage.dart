import 'package:fashion_store/app/detailed_page/controllers/Product_controller.dart';
import 'package:fashion_store/app/detailed_page/view/BottomMenuBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/ProductGridView.dart';

class ProductGridPage extends StatelessWidget {
  final String title;
  final String category;

  const ProductGridPage({
    super.key,
    required this.title,
    this.category = "Marvel",
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductGridController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: TabBar(
              controller: controller.tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              indicatorColor: Colors.black,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: "MEN"),
                Tab(text: "WOMEN"),
              ],
            ),
          ),

          // Product Grid
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                ProductGridView(isMen: true),
                ProductGridView(isMen: false),
              ],
            ),
          ),

          // Bottom Menu Bar
          const BottomMenuBar(),
        ],
      ),
    );
  }
}
