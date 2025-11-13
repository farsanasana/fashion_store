import 'package:flutter/material.dart';

class CategoryDetailPage extends StatelessWidget {
  final Map<String, dynamic> category;

  const CategoryDetailPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // 🧱 Dummy product list (you can replace this with API data)
    final List<Map<String, dynamic>> products = [
      {
        "title": "Green Day: American Idiot",
        "price": "899",
        "image":
            "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1756525677_3953968.jpg?w=300&dpr=2",
        "type": "Oversized T-Shirts",
      },
      {
        "title": "TSS Originals: Kaal Chakra",
        "price": "1599",
        "image":
            "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1761302344_9537876.jpg?w=300&dpr=2",
        "type": "Super Oversized T-Shirts",
      },
      {
        "title": "TSS Originals: Trident",
        "price": "1399",
        "image":
            "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1750415838_4107800.jpg?w=300&dpr=2",
        "type": "Oversized T-Shirts",
      },
      {
        "title": "Black Panther: Royal Fury",
        "price": "1299",
        "image":
            "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1713616797_5057742.jpg?w=300&dpr=2",
        "type": "Super Oversized T-Shirts",
      },
      {
        "title": "TSS Originals: Cosmic Voyager",
        "price": "1599",
        "image":
            "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1744100279_1437321.jpg?w=300&dpr=2",
        "type": "Super Oversized T-Shirts",
      },
      {
        "title": "TSS Originals: Trident",
        "price": "1399",
        "image":
            "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1739262425_8133560.jpg?w=300&dpr=2",
        "type": "Oversized T-Shirts",
      },
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category["name"] ?? "Men T-Shirts"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68, // Adjust height of cards
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                // You can navigate to product detail page here
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🖼 Product Image
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(8)),
                        child: Image.network(
                          product["image"] ?? "",
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey[200],
                            child: const Icon(Icons.image, size: 50),
                          ),
                        ),
                      ),
                    ),

                    // 📋 Product Info
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product["title"] ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            product["type"] ?? "",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "₹${product["price"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
