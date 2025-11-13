import 'package:fashion_store/app/home/views/men/NewArrivalsSection.dart';
import 'package:fashion_store/app/home/views/men/TopPicksSection.dart';
import 'package:fashion_store/app/home/views/men/banner_sections.dart';
import 'package:fashion_store/app/home/views/men/categories_section.dart';
import 'package:fashion_store/app/home/views/men/pack_it_up.dart';
import 'package:fashion_store/app/home/views/men/sectionds/trendingMerchCard.dart';
import 'package:fashion_store/app/home/views/men/sectionds/women/dynamicSection.dart';
import 'package:fashion_store/app/home/views/men/sectionds/women/most_loved_design_section.dart';
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
            PackItUp(category: 'women', title: "women early winter drops"),
            const SizedBox(height: 10),
          //  DynamicSections(title: 'title', sectionData: controller.womenDynamicList),
DynamicSections(title: "Bottom Line Denim",sectionData: controller.womenBottomLine, ),            
 //     FitForAllSection(fitForAll: controller.womenFitForAll, title: 'FITS FOR ALL',),
            const SizedBox(height: 10),
           // CraftedWithIntentSection(category: 'women', title: 'HOUSE OF LINEN',),
DynamicSections(title: "House of Linen",sectionData: controller.womenHouseOfLinen, ),

            const SizedBox(height: 10),
DynamicSections(title: "Style Meets Comfort",sectionData: controller.womenStyleComfort, ),         
   const SizedBox(height: 10),

DynamicSections(title: "The Chill Girl Edit",sectionData: controller.womenChillGirl, ),  
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
