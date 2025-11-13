import 'package:fashion_store/app/cart/controller/cart-controller.dart';
import 'package:fashion_store/app/cart/view/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Custom AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),


        ),
        title: Text(
          product["name"] ?? "",
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.shopping_bag_outlined, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Product Image
            Image.network(
              product["image"] ?? "",
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Product Title
                  Text(
                    product["name"] ?? "",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // ✅ Product Category
                  Text(
                    product["category"] ?? "",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),

                  // ✅ Product Price
                  Text(
                    "₹${product["price"]}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Price inclusive of all taxes",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 24),
                  const Divider(),

                  // ✅ Delivery Details
                  const Text(
                    "Delivery Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Enter Pincode",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "CHECK",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.sync_alt_rounded, color: Colors.teal),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "This product is eligible for return or exchange under our 30-day return or exchange policy. No questions asked.",
                            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  const Divider(),

                  // ✅ Product Details
                  const Text(
                    "Product Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Material & Care:\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "100% Cotton\nMachine Wash\n\n"),
                        TextSpan(
                          text: "Country of Origin: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "India (and proud)\n\n"),
                        TextSpan(
                          text: "Manufactured & Sold By:\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "The Souled Store Pvt. Ltd.\n224, Tantia Jogani Industrial Premises\nJ.R. Boricha Marg, Lower Parel (E)\nMumbai - 400 011\nTel: +91 22-68493328\n\n"),
                        TextSpan(
                          text: "connect@thesouledstore.com\nCustomer care no. +91 22-68493328",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Divider(),

                  // ✅ Product Description (Expandable)
                  ExpansionTile(
                    title: const Text(
                      "Product Description",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product["description"] ??
                              "This stylish super oversized fit t-shirt brings comfort and personality together, perfect for any casual occasion.",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ✅ Others Also Bought
                  const Text(
                    "Others Also Bought",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 270,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildSuggestedItem(
                          image:
                              "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1761114674_9268791.jpg?w=300&dpr=2",
                          name: "Nomad: Compass",
                          price: "₹2399",
                        ),
                        _buildSuggestedItem(
                          image:
                              "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1742976621_3048761.jpg?w=300&dpr=2",
                          name: "Attack On Titan",
                          price: "₹1299",
                        ),
                        _buildSuggestedItem(
                          image:
                              "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1741869882_7521759.jpg?w=300&dpr=2",
                          name: "TSS Originals: Kaal Chakra",
                          price: "₹1549",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Bar (Sticky)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black12,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                label: const Text("WISHLIST"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                
onPressed: () {
  // Show a bottom sheet for size selection before adding to cart
  Get.bottomSheet(
    StatefulBuilder(
      builder: (context, setState) {
        // Move selectedSize OUTSIDE rebuild (use a parent variable)
        String? selectedSize;

        return StatefulBuilder(
          builder: (context, innerSetState) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select Size",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // ✅ Size Options
                  Wrap(
                    spacing: 10,
                    children: ["XS", "S", "M", "L", "XL"].map((size) {
                      bool isSelected = selectedSize == size;
                      return ChoiceChip(
                        label: Text(size),
                        selected: isSelected,
                        selectedColor: Colors.redAccent,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (bool selected) {
                          innerSetState(() {
                            selectedSize = selected ? size : null;
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  // ✅ Add to Cart Button inside BottomSheet
                  ElevatedButton(
                    onPressed: () {
  if (selectedSize == null) {
    Get.snackbar(
      "Select Size",
      "Please choose a size before adding to cart.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  } else {
    // ✅ Add item to cart and navigate
    final CartController cartController = Get.find();

    cartController.addItem(CartItem(
      name: product["name"],
      image: product["image"],
      price: product["price"].toString(),
      size: selectedSize!,
    ));

    Get.back(); // close bottom sheet
    Get.to(() => const CartPage());

    Get.snackbar(
      "Added to Cart",
      "${product["name"]} (Size: $selectedSize) added successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
},

                    // onPressed: () {
                    //   if (selectedSize == null) {
                    //     Get.snackbar(
                    //       "Select Size",
                    //       "Please choose a size before adding to cart.",
                    //       snackPosition: SnackPosition.BOTTOM,
                    //       backgroundColor: Colors.orange,
                    //       colorText: Colors.white,
                    //     );
                    //   } else {
                    //     Get.back(); // Close bottom sheet
                    //     Get.snackbar(
                    //       "Success",
                    //       "${product["name"]} (Size: $selectedSize) added to cart",
                    //       snackPosition: SnackPosition.BOTTOM,
                    //       backgroundColor: Colors.green,
                    //       colorText: Colors.white,
                    //     );
                    //     print("Added to cart: ${product["name"]} - $selectedSize");
                    //   }
                    // },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    ),
  );
},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  "ADD TO CART",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Helper Widget for Suggested Products
  Widget _buildSuggestedItem({
    required String image,
    required String name,
    required String price,
  }) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              height: 180,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            "Super Oversized T-Shirts",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 2),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "Price incl. of all taxes",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
