import 'package:fashion_store/app/home/views/men/banner_sections.dart';
import 'package:fashion_store/app/home/views/men/categories_section.dart';
import 'package:fashion_store/app/home/views/men/pack_it_up.dart';
import 'package:fashion_store/app/home/views/men/sectionds/secondBanner.dart';
import 'package:fashion_store/app/home/views/men/sectionds/sneakersdynamicsection.dart';
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
            const SizedBox(height: 5),
            Secondbanner(banners: controller.sneakersSecondBanners,title: 'DROP ZONE'),
            const SizedBox(height: 10),
          // PackItUp(category: 'sneakers', title: 'PACK IT UP'),
          Sneakersdynamicsection(title: 'fresh out the lab'),
            const SizedBox(height: 10),
            CategoriesSection(categories: controller.sneakerscategories),
            const SizedBox(height: 10),
            Sneakersdynamicsection(title: 'back on popular demand'),
         
            const SizedBox(height: 10),
            Sneakersdynamicsection(title: 'best in ubz'),

                      const SizedBox(height: 10),
             Sneakersdynamicsection(title: 'sneakers for her'),
            const SizedBox(height: 10),
            SneakersOthersSection(title: 'what make us'),
                        const SizedBox(height: 10),


Sneakersdynamicsection(title: 'best in reverb'),
                        const SizedBox(height: 10),
                        Sneakersdynamicsection(title: 'best in fumes'),
                        const SizedBox(height: 10),
                        Sneakersdynamicsection(title: 'the lace edit'),
            const SizedBox(height: 10),
            Sneakersdynamicsection(title: "sock it up"),
            const SizedBox(height: 10),
                SneakersOthersSection(title: "hear it from"),
            const SizedBox(height: 10),
            SneakersOthersSection(title: 'SNEAKERS DEN'),

            const SizedBox(height: 10),
       //     NewArrivalsSection(category: 'Sneakers'),
          ],
        ),
      );
    });
  }
}

