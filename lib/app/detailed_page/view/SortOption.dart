import 'package:flutter/material.dart';
import 'package:fashion_store/app/detailed_page/controllers/Product_controller.dart';
import 'package:get/get.dart';


class SortOption extends StatelessWidget {
  final String label;

  const SortOption({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductGridController>();

    return ListTile(
      title: Text(label),
      onTap: () {
        controller.selectedSort.value = label;
        Get.back();
      },
    );
  }
 }
