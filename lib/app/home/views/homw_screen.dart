

import 'package:fashion_store/app/categories/views/categories_view.dart';
import 'package:fashion_store/app/cart/view/cart_page.dart';
import 'package:fashion_store/app/profiles/views/ProfileView.dart';
import 'package:fashion_store/app/wishlist/views/wishlist_view.dart';
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
                  Get.to(() =>  CartPage());

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
            type: BottomNavigationBarType.fixed, // 👈 Add this line!
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.grey,
  currentIndex: 0, // optional, set based on active tab
  onTap: (index) {
    // Handle navigation here
    switch (index) {
      case 0:
        // Navigate to Home
        Get.to(() => const HomeView());
        break;
      case 1:
        // Navigate to Wishlist
        Get.to(() => const WishlistView());
        break;
      case 2:
        // Navigate to Categories
        Get.to(() => const CategoriesView());
        break;
      case 3:
        // Navigate to Profile
        Get.to(() => const ProfileView());
        break;
    }
  },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "categories"),
           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
           
          ],
        ),
      ),
    );
  }
}

