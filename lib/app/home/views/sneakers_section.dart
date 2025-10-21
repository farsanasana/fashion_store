import 'package:fashion_store/app/home/views/men/banner_sections.dart';
import 'package:fashion_store/app/home/views/men/pack_it_up.dart';
import 'package:fashion_store/app/home/views/men/sneakers_den_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class SneakersSection extends StatelessWidget {
  final HomeController controller;

  const SneakersSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerSection(banners: controller.sneakersBanners),
            const SizedBox(height: 10),
              PackItUp(controller: controller, title: 'FRESH OUT THE LAB'),
            const SizedBox(height: 10),
              PackItUp(controller: controller, title: 'BACK ON POPULAR DEMAND'),
            const SizedBox(height: 10),
              PackItUp(controller: controller, title: 'BEST IN UBZ'),
            const SizedBox(height: 10),
              PackItUp(controller: controller, title: 'BEST IN REVERB'),
            const SizedBox(height: 10),
              PackItUp(controller: controller, title: 'BEST IN FUMES'),
            const SizedBox(height: 10),
              PackItUp(controller: controller, title: 'THE LACE EDIT'),
            const SizedBox(height: 10),
              PackItUp(controller: controller, title: 'SOCK IT UP'),
            const SizedBox(height: 10),
              PackItUp(controller: controller, title: 'PASTTEL PICKS'),
            const SizedBox(height: 10),
            SneakersDenSection(),

            const SizedBox(height: 10),
       //     NewArrivalsSection(category: 'Sneakers'),
          ],
        ),
      );
    });
  }
}

