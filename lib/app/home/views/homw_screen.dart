
// import 'package:fashion_store/app/home/views/sectionds/NewArrivalsSection.dart';
// import 'package:fashion_store/app/home/views/sectionds/TopPicksSection.dart';
// import 'package:fashion_store/app/home/views/sectionds/banner_sections.dart';
// import 'package:fashion_store/app/home/views/sectionds/categories_section.dart';
// import 'package:fashion_store/app/home/views/sectionds/crafted_with_intent_section.dart';
// import 'package:fashion_store/app/home/views/sectionds/fandom_hidden_gems_section.dart';
// import 'package:fashion_store/app/home/views/sectionds/iconic_supima_tees_section.dart';
// import 'package:fashion_store/app/home/views/sectionds/markdowns_section.dart';
// import 'package:fashion_store/app/home/views/sectionds/office_edit_section.dart';
// import 'package:fashion_store/app/home/views/sectionds/official_collabs_section.dart';
// import 'package:fashion_store/app/home/views/sectionds/shopForCard.dart';
// import 'package:fashion_store/app/home/views/sectionds/sneakers_den_section.dart';
// import 'package:fashion_store/app/home/views/sectionds/trending_merch_section.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/home_controller.dart';


// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.put(HomeController());

//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Fashion Store"),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: "Men"),
//               Tab(text: "Women"),
//               Tab(text: "Sneakers"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildTabContent(controller),
//             _buildTabContent(controller),
//             _buildTabContent(controller),
//           ],
//         ),
//         bottomNavigationBar:  BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
//             BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Cart"),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabContent(HomeController controller) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
        
//       }

//       return SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//   BannerSection(banners: controller.banners),
//   NewArrivalsSection(),
//   CategoriesSection(),
//   TopPicksSection(topPicks: controller.topPicks),
//   CraftedWithIntentSection(),
//   OfficeEditSection(officeEdits: controller.officeEdits),
//   TrendingMerchSection(trendingMerch: controller.trendingMerch),
//   OfficialCollabsSection(controller: controller, officialCollabs: controller.officialCollabs),
//   FandomHiddenGemsSection(fandomHiddenGems: controller.fandomHiddenGems),
//   SneakersDenSection(sneakersDen: controller.sneakersDen),
//   IconicSupimaTeesSection(controller: controller),
//   MarkdownsSection(),
//   ShopForSection(),

// ],
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'menSection_screen.dart';
import 'sneakers_section.dart';
import 'women_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:  AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black, size: 28),
              onPressed: () {
                // Handle menu tap
              },
            ),
            title: Image.asset(
              'assets/images/logo.png', // Replace with your logo path
              //'assets/images/logo.png' // Replace with your logo path
              height: 40,
              fit: BoxFit.contain,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black, size: 28),
                onPressed: () {
                  // Handle search tap
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 28),
                onPressed: () {
                  // Handle cart tap
                },
              ),
            ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Men"),
              Tab(text: "Women"),
              Tab(text: "Sneakers"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MenSection(controller: controller),
            WomenSection(controller: controller),
            SneakersSection(controller: controller),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Cart"),
          ],
        ),
      ),
    );
  }
}

