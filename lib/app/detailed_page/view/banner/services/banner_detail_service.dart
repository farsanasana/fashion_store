// lib/app/banner_detail/services/banner_detail_service.dart
class BannerDetailService {
  // Fetch products based on banner
  Future<List<Map<String, dynamic>>> fetchProducts(String bannerId) async {
    await Future.delayed(const Duration(milliseconds: 500)); // simulate delay

    // 🔹 Mock API response (replace with real API call later)
    return [
      {
        "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1756476946_4773055.jpg?w=300&dpr=2",
        "name": "Looney Tunes: Bugs",
        "category": "Holiday Shirts",
        "price": "1699",
        "tag": "RELAXED FIT"
      },
      {
        "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1750426444_9028342.jpg?w=300&dpr=2",
        "name": "Cotton Linen: Berry",
        "category": "Cotton Linen Shirts",
        "price": "1499",
        "tag": "LINEN BLEND"
      },
      {
        "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1750415838_4107800.jpg?w=300&dpr=2",
        "name": "Cotton Linen: Mint",
        "category": "Cotton Linen Shirts",
        "price": "1499",
        "tag": "LINEN BLEND"
      },
      {
        "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1761114674_9268791.jpg?w=300&dpr=2",
        "name": "Cotton Linen: Mauve",
        "category": "Cotton Linen Shirts",
        "price": "1499",
        "tag": "LINEN BLEND"
      },
    ];
  }
}
