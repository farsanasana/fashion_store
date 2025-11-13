import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistItems = [
      {
        "image": "https://thesouledstore.com/static/img/placeholder.png",
        "name": "Oversized Tee",
        "price": "₹799",
      },
      {
        "image": "https://thesouledstore.com/static/img/placeholder.png",
        "name": "Hoodie",
        "price": "₹1299",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text("My Wishlist"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: wishlistItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(item["image"]!, fit: BoxFit.cover, width: double.infinity),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(item["price"]!, style: const TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
