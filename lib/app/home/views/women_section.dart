import 'package:fashion_store/app/home/views/men/NewArrivalsSection.dart';
import 'package:fashion_store/app/home/views/men/TopPicksSection.dart';
import 'package:fashion_store/app/home/views/men/banner_sections.dart';
import 'package:fashion_store/app/home/views/men/categories_section.dart';
import 'package:fashion_store/app/home/views/men/crafted_with_intent_section.dart';
import 'package:fashion_store/app/home/views/men/sectionds/fits_for_all.dart';
import 'package:fashion_store/app/home/views/men/sectionds/trendingMerchCard.dart';
import 'package:fashion_store/app/home/views/men/sectionds/women/most_loved_design_section.dart';
import 'package:fashion_store/app/home/views/widgets/most_loved_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class WomenSection extends StatelessWidget {
  final HomeController controller;

  const WomenSection({super.key, required this.controller});

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
            BannerSection(banners: controller.womenBanners),
            const SizedBox(height: 10),
            NewArrivalsSection(title: 'New Arrivals', newArrivals: controller.womenNewArrivals),
            const SizedBox(height: 10),
           // TopPicksSection(topPicks: controller.womenTopPicks, title: 'THE VARSITY EDIT'),
           // const SizedBox(height: 10),
                  //     CategoriesSection(categories: controller.mencategories),

            CategoriesSection(categories: controller.womencategories),
            const SizedBox(height: 10),
            TopPicksSection(topPicks: controller.womenTopPicks, title: 'Top 10 PICKS OF THE WEEK'),
            const SizedBox(height: 10),
          //  CraftedWithIntentSection(category: 'women', title: 'CURATED FOR YOU',),
          TrendingMerchSection(category: 'women', title: 'CURATED FOR YOU'),
            const SizedBox(height: 10),
            TrendingMerchSection(category: 'women', title: 'BOTTOM - LINE DENIM'),
            const SizedBox(height: 10),
            FitForAllSection(fitForAll: controller.womenFitForAll, title: 'FITS FOR ALL',),
            const SizedBox(height: 10),
           // CraftedWithIntentSection(category: 'women', title: 'HOUSE OF LINEN',),
           TrendingMerchSection(category: 'women', title: 'HOUSE OF LINEN'),
            const SizedBox(height: 10),
            TrendingMerchSection(category: 'women', title: 'STYLE MEETS COMFORT'),
            const SizedBox(height: 10),

            TrendingMerchSection(category: 'women', title: 'THE CHILL GIRL EDIT',),
            const SizedBox(height: 10),
            TrendingMerchSection(category: 'women', title: 'SHE MEANS BUSINESS',),
            const SizedBox(height: 10),
            MostLovedDesignSection(),
            const SizedBox(height: 10),
            TrendingMerchSection(category: 'women', title: 'TRENDING MERCH', ),
            const SizedBox(height: 10),
            

          ],
        ),
      );
    });
  }
}
