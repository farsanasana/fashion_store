import 'package:fashion_store/app/detailed_page/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductGridController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final selectedSort = 'SORT'.obs;
  final selectedTab = 0.obs;
  final menProducts = <Product>[].obs;
  final womenProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      selectedTab.value = tabController.index;
    });

    // Initialize MEN products
    menProducts.value = [
      Product(
        name: "Deadpool: Wade Wils...",
        category: "Men Oversized Hoodies",
        price: "₹1999",
        image: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1736662837_8365054.jpg?w=300&dpr=2",
        fabric: "PREMIUM HEAVY FLEECE",
      ),
      Product(
        name: "Ghost Rider: Hell Cyc...",
        category: "Varsity Jackets",
        price: "₹2599",
        image: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1758967526_3596320.jpg?w=300&dpr=2",
        fabric: "PREMIUM HEAVY FLEECE",
      ),
        Product(
        name: "Deadpool: Wade Wils...",
        category: "Men Oversized Hoodies",
        price: "₹1999",
        image: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1750077198_2588988.jpg?w=300&dpr=2",
        fabric: "PREMIUM HEAVY FLEECE",
      ),
      Product(
        name: "Ghost Rider: Hell Cyc...",
        category: "Varsity Jackets",
        price: "₹2599",
        image: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1744389529_7123437.jpg?w=300&dpr=2",
        fabric: "PREMIUM HEAVY FLEECE",
      ),
    ];

    // Initialize WOMEN products
    womenProducts.value = [
      Product(
        name: "Black Widow: Femme Fatale",
        category: "Women Crop Tops",
        price: "₹1499",
        image: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/269741-Marvel-Creative-Chaos-Oversized-T-Shirts12025_10_23-11-48-15.jpg?w=300&dpr=2",
        fabric: "PREMIUM COTTON FABRIC",
      ),

      Product(
        name: "Scarlet Witch: Chaos Magic",
        category: "Women Sweatshirts",
        price: "₹1799",
        image: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/Doctor-Doom-Destroyer-Oversized-T-shirts%20(1)2024_09_01-12-05-41.jpg?w=300&dpr=2",
        fabric: "SOFT FLEECE FABRIC",
      ),
            Product(
        name: "Black Widow: Femme Fatale",
        category: "Women Crop Tops",
        price: "₹1499" ,
        image: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1722610914_4393266.jpg?w=300&dpr=2",
        fabric: "PREMIUM COTTON FABRIC",
      ),

        Product(
        name: "Scarlet Witch: Chaos Magic",
        category: "Women Sweatshirts",
        price: "₹1799",
        image: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/Venom-Eddie-Brock-Oversized-T-Shirts2025_09_17-11-47-44.jpg?w=300&dpr=2",
        fabric: "SOFT FLEECE FABRIC",
      ),
    ];
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void toggleFavorite(Product product) {
    product.isFavorite.toggle();
  }
}
