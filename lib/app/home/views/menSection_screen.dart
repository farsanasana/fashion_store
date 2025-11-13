
// import 'package:fashion_store/app/home/controller/home_controller.dart';
// import 'package:fashion_store/app/home/views/men/NewArrivalsSection.dart';
// import 'package:fashion_store/app/home/views/men/TopPicksSection.dart';

// import 'package:fashion_store/app/home/views/men/banner_sections.dart';
// import 'package:fashion_store/app/home/views/men/categories_section.dart';
// import 'package:fashion_store/app/home/views/men/crafted_with_intent_section.dart';
// import 'package:fashion_store/app/home/views/men/markdowns_section.dart';
// import 'package:fashion_store/app/home/views/men/office_edit_section.dart';
// import 'package:fashion_store/app/home/views/men/pack_it_up.dart';
// import 'package:fashion_store/app/home/views/men/shopForCard.dart';
// import 'package:fashion_store/app/home/views/men/sneakers_den_section.dart';
// import 'package:fashion_store/app/home/views/men/sectionds/trendingMerchCard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class MenSection extends StatelessWidget {
//   final HomeController controller;

//   const MenSection({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }

//       return SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 4),
//             BannerSection(banners: controller.menBanners),
//             NewArrivalsSection(title: 'New Arrivals', newArrivals: controller.menNewArrivals),
//             const SizedBox(height: 10),
//             CategoriesSection(categories: controller.mencategories),
//             const SizedBox(height: 10),
//             TopPicksSection(topPicks: controller.menTopPicks, title: 'Top 10 PICKS OF THE WEEK'),
//             const SizedBox(height: 10),
         
//             CraftedWithIntentSection(category: 'men', title: 'CRAFTED WITH INTENT',),
//             const SizedBox(height: 10),
//             PackItUp(controller: controller, title: "Pack It Up"),
//             const SizedBox(height: 10),
           
         
//             OfficialCollabsSection(),
//             const SizedBox(height: 10),
    
// SneakersDenSection(),
//             const SizedBox(height: 10),

//           ],
//         ),
//       );
//     });
//   }
// }

import 'package:fashion_store/app/home/controller/home_controller.dart';
import 'package:fashion_store/app/home/views/men/NewArrivalsSection.dart';
import 'package:fashion_store/app/home/views/men/TopPicksSection.dart';
import 'package:fashion_store/app/home/views/men/banner_sections.dart';
import 'package:fashion_store/app/home/views/men/categories_section.dart';
import 'package:fashion_store/app/home/views/men/crafted_with_intent_section.dart';
import 'package:fashion_store/app/home/views/men/office_edit_section.dart';
import 'package:fashion_store/app/home/views/men/pack_it_up.dart';
import 'package:fashion_store/app/home/views/men/sneakers_den_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenSection extends StatelessWidget {
  final HomeController controller;

  const MenSection({super.key, required this.controller});

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
            const SizedBox(height: 4),
            BannerSection(banners: controller.menBanners),
            NewArrivalsSection(
              title: 'New Arrivals',
              newArrivals: controller.menNewArrivals
            ),
            const SizedBox(height: 10),
            CategoriesSection(categories: controller.mencategories),
            const SizedBox(height: 10),
            TopPicksSection(
              topPicks: controller.menTopPicks,
              title: 'Top 10 PICKS OF THE WEEK'
            ),
            const SizedBox(height: 10),
            
            // ADD PACK IT UP HERE
          
            
            CraftedWithIntentSection(
              category: 'men',
              title: 'CRAFTED WITH INTENT',
            ),
            const SizedBox(height: 10),
  PackItUp(category: 'men', title: "men early winter drops"),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            
            OfficialCollabsSection(),
            const SizedBox(height: 10),

            SneakersOthersSection(title: 'SNEAKERS DEN'),
            const SizedBox(height: 10),
          ],
        ),
      );
    });
  }
}
