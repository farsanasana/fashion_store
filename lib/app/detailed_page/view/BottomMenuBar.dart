
import 'package:fashion_store/app/detailed_page/controllers/Product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BottomMenuButton.dart';

class BottomMenuBar extends StatelessWidget {
  const BottomMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductGridController>();

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: BottomMenuButton(
              icon: Icons.menu,
              label: "MENU",
              onTap: () {},
            ),
          ),
          Container(width: 1, height: 50, color: Colors.grey[300]),
          Expanded(
            child: BottomMenuButton(
              icon: Icons.filter_alt_outlined,
              label: "FILTER",
              onTap: () {},
            ),
          ),
          Container(width: 1, height: 50, color: Colors.grey[300]),
          Expanded(
            child: Obx(() => BottomMenuButton(
              icon: Icons.swap_vert,
              label: controller.selectedSort.value,
              onTap: () => controller.selectedSort(),
            )),
          ),
        ],
      ),
    );
  }
}