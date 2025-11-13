import 'package:get/get.dart';

class Product {
  final String name;
  final String category;
  final String price;
  final String image;
  final String tag;
  final String fabric;
  final RxBool isFavorite; // Changed to RxBool

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    this.tag = "OVERSIZED FIT",
    this.fabric = "",
    bool isFavorite = false,
  }) : isFavorite = RxBool(isFavorite);
}