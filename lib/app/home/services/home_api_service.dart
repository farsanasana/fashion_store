import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.example.com";

  // FIXED: Remove the infinite recursion - these should call _fetchData
  static Future<List<Map<String, dynamic>>> fetchPackItUp() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/pack-it-up"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyPackItUp();
    } catch (e) {
      return _dummyPackItUp();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchEarlyWinterDrops() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/early-winter-drops"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyEarlyWinterDrops();
    } catch (e) {
      return _dummyEarlyWinterDrops();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchCraftedWithIntent() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/crafted-with-intent"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyCraftedWithIntent();
    } catch (e) {
      return _dummyCraftedWithIntent();
    }
  }

  // Fetch banners
  static Future<List<Map<String, String>>> fetchBanners({String category = "general"}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/banners?category=$category"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["banners"] != null && data["banners"].isNotEmpty) {
          return List<Map<String, String>>.from(data["banners"]);
        }
      }
      return _dummyBanners(category);
    } catch (e) {
      return _dummyBanners(category);
    }
  }

  // Fetch new arrivals
  static Future<List<Map<String, dynamic>>> fetchNewArrivals({String category = "general"}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/new-arrivals?category=$category"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyNewArrivals(category);
    } catch (e) {
      return _dummyNewArrivals(category);
    }
  }

  // Fetch categories
  static Future<List<Map<String, dynamic>>> fetchCategories({String category = "general"}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/categories?category=$category"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["categories"] != null && data["categories"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["categories"]);
        }
      }
      return _dummyCategories(category);
    } catch (e) {
      return _dummyCategories(category);
    }
  }

  // Fetch trending merch
  static Future<List<Map<String, dynamic>>> fetchTrendingMerch({String category = "general"}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/trending-merch?category=$category"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyTrendingMerch(category);
    } catch (e) {
      return _dummyTrendingMerch(category);
    }
  }

  static Future<List<Map<String, dynamic>>> fetchCraftedItems({String category = "general"}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/crafted-items?category=$category"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["items"] != null && data["items"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["items"]);
        }
      }
      return _dummyCraftedItems(category);
    } catch (e) {
      return _dummyCraftedItems(category);
    }
  }

  // Fetch office edits
  static Future<List<Map<String, dynamic>>> fetchOfficeEdits() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/office-edits"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyOfficeEdits();
    } catch (e) {
      return _dummyOfficeEdits();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchOfficialCollabs() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/official-collabs"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyOfficialCollabs();
    } catch (e) {
      return _dummyOfficialCollabs();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchSneakersDen() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/sneakers-den"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummySneakersDen();
    } catch (e) {
      return _dummySneakersDen();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchSupimaTees() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/supima-tees"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummySupimaTees();
    } catch (e) {
      return _dummySupimaTees();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchFandomHiddenGems() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/fandom-hidden-gems"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyFandomHiddenGems();
    } catch (e) {
      return _dummyFandomHiddenGems();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchMarkdowns() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/markdowns"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["markdowns"] != null && data["markdowns"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["markdowns"]);
        }
      }
      return _dummyMarkdowns();
    } catch (e) {
      print('Error fetching markdowns: $e');
      return _dummyMarkdowns();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchShopForCategories() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/shop-for"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["categories"] != null && data["categories"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["categories"]);
        }
      }
      return _dummyShopForCategories();
    } catch (e) {
      return _dummyShopForCategories();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchFitForAll({String category = "general"}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/fit-for-all?category=$category"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyFitForAll(category);
    } catch (e) {
      return _dummyFitForAll(category);
    }
  }

  // ---------------------- Dummy fallbacks ----------------------

  static List<Map<String, String>> _dummyBanners(String category) {
    if (category == "men") {
      return [
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/rashuuuuu_jY3O3bx.jpg?w=768&dpr=2"},
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/App_Banner_BW-WHITE_BDSJDez.jpg?w=768&dpr=2"},
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/mobile_19_8eckstT.jpg?w=768&dpr=2"},
      ];
    } else if (category == "women") {
      return [
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/hp_StTEBXJ.jpg?w=1500&dpr=1.3"},
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/app_ban2.1_Wvcgoku.jpg?w=768&dpr=2"},
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/shoes_app_1_fklQFgY.jpg?w=768&dpr=2"},
      ];
    } else if (category == "sneakers") {
      return [
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/app_ban_1_E1UC9rQ.jpg?w=768&dpr=2"},
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/AppBanner_chXRsPi.jpg?w=768&dpr=2"},
        {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/friends_sneaker_app_gyQLYXT_EA1d5bg.png?w=768&dpr=2"}
      ];
    }
    return [];
  }

  // FIXED: Added proper return types
  static List<Map<String, dynamic>> _dummyPackItUp() {
    return [
      {
        "id": "1",
        "name": "Travel Backpack Pro",
        "category": "Bags & Backpacks",
        "price": "2499",
        "image": "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=500&fit=crop",
      },
      {
        "id": "2",
        "name": "Weekender Duffle Bag",
        "category": "Travel Bags",
        "price": "3299",
        "image": "https://images.unsplash.com/photo-1491637639811-60e2756cc1c7?w=400&h=500&fit=crop",
      },
      {
        "id": "3",
        "name": "Compact Gym Bag",
        "category": "Sports Bags",
        "price": "1799",
        "image": "https://images.unsplash.com/photo-1547949003-9792a18a2601?w=400&h=500&fit=crop",
      },
      {
        "id": "4",
        "name": "Canvas Tote Bag",
        "category": "Everyday Bags",
        "price": "899",
        "image": "https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=400&h=500&fit=crop",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummyEarlyWinterDrops() {
    return [
      {
        "id": "1",
        "name": "TSS Originals: Snow Storm",
        "category": "Jackets",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Top_Selling_1_Ftyl9Lq.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "Hooded Sweater: Nova",
        "category": "Pullover",
        "price": "2499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Top_Selling_2_2LBDcgh.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Naruto Shippuden: Itachi's Story",
        "category": "Hoodies",
        "price": "2499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Top_Selling_3_RBbaJIZ.jpg?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Oversized Jacket: Mandala",
        "category": "Jackets",
        "price": "2499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Top_Selling_4_FNutfoA.jpg?w=360&dpr=2",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummyCraftedWithIntent() {
    return [
      {
        "id": "1",
        "name": "Artisan Leather Wallet",
        "category": "Accessories",
        "price": "1299",
        "image": "https://images.unsplash.com/photo-1627123424574-724758594e93?w=400&h=500&fit=crop",
      },
      {
        "id": "2",
        "name": "Hand-Stitched Belt",
        "category": "Belts",
        "price": "899",
        "image": "https://images.unsplash.com/photo-1624222247344-67d90e4d30c4?w=400&h=500&fit=crop",
      },
      {
        "id": "3",
        "name": "Minimalist Watch",
        "category": "Watches",
        "price": "3999",
        "image": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=500&fit=crop",
      },
      {
        "id": "4",
        "name": "Organic Cotton Tee",
        "category": "Sustainable Fashion",
        "price": "1199",
        "image": "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=500&fit=crop",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummyMarkdowns() {
    return [
      {
        "id": "1",
        "name": "Official Merch Clearance",
        "category": "OFFICIAL MERCH",
        "price": "599",
        "image": "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400&h=600&fit=crop",
        "badge": "CLEARANCE",
      },
      {
        "id": "2",
        "name": "Shirts Clearance",
        "category": "SHIRTS",
        "price": "799",
        "image": "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400&h=600&fit=crop",
        "badge": "CLEARANCE",
      },
      {
        "id": "3",
        "name": "Winter Jackets Sale",
        "category": "JACKETS",
        "price": "1499",
        "image": "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&h=600&fit=crop",
        "badge": "50% OFF",
      },
      {
        "id": "4",
        "name": "Accessories Limited Stock",
        "category": "ACCESSORIES",
        "price": "399",
        "image": "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=600&fit=crop",
        "badge": "CLEARANCE",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummyShopForCategories() {
    return [
      {
        "id": "1",
        "name": "ACCESSORIES",
        "image": "https://picsum.photos/600/800?random=120",
        "subtitle": "Complete Your Look",
      },
      {
        "id": "2",
        "name": "WOMEN'S COLLECTION",
        "image": "https://picsum.photos/600/800?random=121",
        "subtitle": "Explore Latest Trends",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummyCategories(String category) {
    if (category == "men") {
      return [
        {"id": "1", "name": "T-SHIRTS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/5_6_z4fRtnN.jpg?w=480&dpr=2"},
        {"id": "2", "name": "SHIRTS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/jacket_uNDP2Mq.jpg?w=480&dpr=2"},
        {"id": "3", "name": "JEANS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/8_3_ikwMNmz.jpg?w=480&dpr=2"},
        {"id": "4", "name": "JACKETS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_7_uBOklwH.jpg?w=480&dpr=2"},
      ];
    } else if (category == "women") {
      return [
        {"id": "1", "name": "DRESSES", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/tshirts_rCXevzh.jpg?w=480&dpr=2"},
        {"id": "2", "name": "TOPS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/shirts_wUyCmmA.jpg?w=480&dpr=2"},
        {"id": "3", "name": "SKIRTS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/tshirts_Kbpk562.jpg?w=480&dpr=2"},
        {"id": "4", "name": "ACCESSORIES", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Big_Polos_3_xTXnFYJ.jpg?w=480&dpr=2"},
      ];
    }
    return [];
  }

  static List<Map<String, dynamic>> _dummyNewArrivals(String category) {
    if (category == "men") {
      return [
        {
          "id": "1",
          "name": "Souled: Outlast",
          "category": "Men Low Top Sneakers",
          "price": "2599",
          "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760509604_2781851.jpg?w=360&dpr=2",
        },
        {
          "id": "2",
          "name": "Punisher: Justice",
          "category": "Jackets",
          "price": "2599",
          "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760425639_1365852.jpg?w=360&dpr=2",
        },
        {
          "id": "3",
          "name": "Oversized T-Shirt: Gothic Buildings",
          "category": "Oversized T-Shirts",
          "price": "999",
          "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760427917_6056717.jpg?w=360&dpr=2",
        },
      ];
    } else if (category == "women") {
      return [
        {
          "id": "1",
          "name": "Floral Maxi Dress",
          "category": "Dresses",
          "price": "1299",
          "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760427917_6056717.jpg?w=360&dpr=2",
        },
        {
          "id": "2",
          "name": "Silk Blouse",
          "category": "Tops",
          "price": "799",
          "image": "https://picsum.photos/400/500?random=21",
        },
      ];
    }
    return [];
  }

  static List<Map<String, dynamic>> _dummyCraftedItems(String category) {
    if (category == "men") {
      return [
        {"id": "1", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Collection_Tile_1Artboard_1.jpg?w=480&dpr=2"},
        {"id": "2", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Collection_Tile_1Artboard_2.jpg?w=480&dpr=2"},
        {"id": "3", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Collection_Tile_1Artboard_3.jpg?w=480&dpr=2"},
      ];
    } else if (category == "women") {
      return [
        {"id": "1", "image": "https://picsum.photos/800/400?random=42"},
        {"id": "2", "image": "https://picsum.photos/800/400?random=43"},
      ];
    }
    return [];
  }

  static List<Map<String, dynamic>> _dummyOfficeEdits() {
    return [
      {
        "id": "1",
        "name": "Formal Slim Fit Shirt",
        "category": "Office Wear",
        "price": "1499",
        "image": "https://picsum.photos/400/500?random=50",
      },
      {
        "id": "2",
        "name": "Classic Formal Trousers",
        "category": "Office Wear",
        "price": "1999",
        "image": "https://picsum.photos/400/500?random=51",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummyOfficialCollabs() {
    return [
      {
        "id": "1",
        "name": "Muichiro Tokito Tee",
        "category": "Official Collab",
        "price": "1299",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/fandom_tile.jpg?w=480&dpr=2",
      },
      {
        "id": "2",
        "name": "Spider-Man Venom Tee",
        "category": "Official Collab",
        "price": "1399",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Venom2.jpg?w=480&dpr=2",
      },
      {
        "id": "3",
        "name": "DC Comics Batman Tee",
        "category": "Official Collab",
        "price": "1299",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/dc-1.jpg?w=480&dpr=2",

      }
    ];
  }

  static List<Map<String, dynamic>> _dummyFandomHiddenGems() {
    return [
      {
        "id": "1",
        "name": "Uchiha Sasuke Tee",
        "category": "Fandom Hidden Gems",
        "price": "1199",
        "image": "https://picsum.photos/400/500?random=80",
      },
      {
        "id": "2",
        "name": "The Punisher Tee",
        "category": "Fandom Hidden Gems",
        "price": "1299",
        "image": "https://picsum.photos/400/500?random=81",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummySneakersDen() {
    return [
      {
        "id": "1",
        "name": "Urban Blaze",
        "category": "Sneakers",
        "price": "2999",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2_1_gOW4Xgi.jpg?w=480&dpr=2",
      },
      {
        "id": "2",
        "name": "Functional Classic",
        "category": "Sneakers",
        "price": "3499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_1_z9VjfjA.jpg?w=480&dpr=2",
      },
      {
        "id": "3",
        "name": "Sporty Vibes",
        "category": "Sneakers",
        "price": "2799",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/1_1_BOAtn5v.jpg?w=480&dpr=2",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummySupimaTees() {
    return [
      {
        "id": "1",
        "name": "White Supima Tee",
        "category": "Premium T-Shirts",
        "price": "1299",
        "image": "https://picsum.photos/600/700?random=100",
      },
      {
        "id": "2",
        "name": "Premium Supima Tee",
        "category": "Premium T-Shirts",
        "price": "1299",
        "image": "https://picsum.photos/600/700?random=101",
      },
    ];
  }

  static List<Map<String, dynamic>> _dummyFitForAll(String category) {
    if (category == "men") {
      return [
        {
          "id": "1",
          "name": "Men's Oversized Tee",
          "category": "Oversized T-Shirts",
          "price": "899",
          "image": "https://picsum.photos/400/500?random=10",
        },
        {
          "id": "2",
          "name": "Everybody Croaks",
          "category": "Oversized T-Shirts",
          "price": "899",
          "image": "https://picsum.photos/400/500?random=11",
        },
      ];
    } else if (category == "women") {
      return [
        {
          "id": "1",
          "name": "Floral Maxi Dress",
          "category": "Dresses",
          "price": "1299",
          "image": "https://picsum.photos/400/500?random=20",
        },
        {
          "id": "2",
          "name": "Silk Blouse",
          "category": "Tops",
          "price": "799",
          "image": "https://picsum.photos/400/500?random=21",
        },
      ];
    }
    return [];
  }

  // static List<Map<String, dynamic>> _dummyTrendingMerch(String category) {

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String baseUrl = "https://api.example.com";
// static Future<List<dynamic>> fetchPackItUp() => fetchPackItUp(category: 'pack-it-up');
// static Future<List<dynamic>> fetchEarlyWinterDrops() => fetchEarlyWinterDrops(category: 'early-winter-drops');
// static Future<List<dynamic>> fetchCraftedWithIntent() => fetchCraftedWithIntent(category: 'crafted-with-intent');
// // Fetch banners
// static Future<List<Map<String, String>>> fetchBanners({String category = "general"}) async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/banners?category=$category"));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       if (data["banners"] != null && data["banners"].isNotEmpty) {
//         return List<Map<String, String>>.from(data["banners"]);
//       }
//     }
//     return _dummyBanners(category);
//   } catch (e) {
//     return _dummyBanners(category);
//   }
// }

//   // Fetch new arrivals
//   static Future<List<Map<String, dynamic>>> fetchNewArrivals({String category = "general"}) async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/new-arrivals?category=$category"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data["products"] != null && data["products"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["products"]);
//         }
//       }
//       return _dummyNewArrivals(category);
//     } catch (e) {
//       return _dummyNewArrivals(category);
//     }
//   }

//   // Fetch categories
//    static Future<List<Map<String, dynamic>>> fetchCategories({String category = "general"}) async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/categories?category=$category"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data["categories"] != null && data["categories"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["categories"]);
//         }
//       }
//       // Return dummy data if API fails or no categories found
//       return _dummyCategories(category);
//     } catch (e) {
//     return _dummyCategories(category);
//     }
//   }
  
//   // Fetch trending merch
//   static Future<List<Map<String, dynamic>>> fetchTrendingMerch({String category = "general"}) async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/trending-merch?category=$category"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data["products"] != null && data["products"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["products"]);
//         }
//       }
//       return _dummyTrendingMerch(category);
//     } catch (e) {
//       return _dummyTrendingMerch(category);
//     }
//   }
//   static Future<List<Map<String, dynamic>>> fetchCraftedItems({String category = "general"}) async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/crafted-items?category=$category"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data["items"] != null && data["items"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["items"]);
//         }
//       }
//       return _dummyCraftedItems(category);
//     } catch (e) {
//       return _dummyCraftedItems(category);
//     }
//   }

//  // Common fetch method
// static Future<List<Map<String, dynamic>>> fetchPackItUp({String category = "general"}) async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/pack-it-up?category=$category"));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data["products"] != null && data["products"].isNotEmpty) {
//         return List<Map<String, dynamic>>.from(data["products"]);
//       }
//     }
//     return _dummyPackItUp(category);
//   } catch (e) {
//     return _dummyPackItUp(category);
//   }
// }

// static Future<List<Map<String, dynamic>>> fetchEarlyWinterDrops({String category = "general"}) async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/early-winter-drops?category=$category"));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data["products"] != null && data["products"].isNotEmpty) {
//         return List<Map<String, dynamic>>.from(data["products"]);
//       }
//     }
//     return _dummyEarlyWinterDrops(category);
//   } catch (e) {
//     return _dummyEarlyWinterDrops(category);
//   }
// }

// static Future<List<Map<String, dynamic>>> fetchCraftedWithIntent({String category = "general"}) async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/crafted-with-intent?category=$category"));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data["products"] != null && data["products"].isNotEmpty) {
//         return List<Map<String, dynamic>>.from(data["products"]);
//       }
//     }
//     return _dummyCraftedWithIntent(category);
//   } catch (e) {
//     return _dummyCraftedWithIntent(category);
//   }
// }

//   // Fetch crafted items


//   // Fetch office edits
//   static Future<List<Map<String, dynamic>>> fetchOfficeEdits() async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/office-edits"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data["products"] != null && data["products"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["products"]);
//         }
//       }
//       return _dummyOfficeEdits();
//     } catch (e) {
//       return _dummyOfficeEdits();
//     }
//   }

// static Future<List<Map<String, dynamic>>> fetchOfficialCollabs() async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/official-collabs"));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data["products"] != null && data["products"].isNotEmpty) {
//         return List<Map<String, dynamic>>.from(data["products"]);
//       }
//     }
//     return _dummyOfficialCollabs();
//   } catch (e) {
//     return _dummyOfficialCollabs();
//   }
// }
//  static Future<List<Map<String, dynamic>>> fetchSneakersDen() async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/sneakers-den"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data["products"] != null && data["products"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["products"]);
//         }
//       }
//       return _dummySneakersDen();
//     } catch (e) {
//       return _dummySneakersDen();
//     }
//   }

//   // Fetch supima tees
//   static Future<List<Map<String, dynamic>>> fetchSupimaTees() async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/supima-tees"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data["products"] != null && data["products"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["products"]);
//         }
//       }
//       return _dummySupimaTees();
//     } catch (e) {
//       return _dummySupimaTees();
//     }
//   }
  

// static Future<List<Map<String, dynamic>>> fetchFandomHiddenGems() async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/fandom-hidden-gems"));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data["products"] != null && data["products"].isNotEmpty) {
//         return List<Map<String, dynamic>>.from(data["products"]);
//       }
//     }
//     return _dummyFandomHiddenGems();
//   } catch (e) {
//     return _dummyFandomHiddenGems();
//   }
// } // NEW: Fetch Markdowns
//   static Future<List<Map<String, dynamic>>> fetchMarkdowns() async {
//   try {
//     final response = await http.get(Uri.parse("$baseUrl/markdowns"));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data["markdowns"] != null && data["markdowns"].isNotEmpty) {
//         return List<Map<String, dynamic>>.from(data["markdowns"]);
//       }
//     }
//     return _dummyMarkdowns();
//   } catch (e) {
//     print('Error fetching markdowns: $e');
//     return _dummyMarkdowns();
//   }
// }

//   // NEW: Fetch Shop For Categories
// static Future<List<Map<String, dynamic>>> fetchShopForCategories() async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/shop-for"));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data["categories"] != null && data["categories"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["categories"]);
//         }
//       }
//       return _dummyShopForCategories();
//     } catch (e) {
//       return _dummyShopForCategories();
//     }
//   }
// static Future<List<Map<String, dynamic>>> fetchFitForAll({String category = "general"}) async {
//     try {
//       final response = await http.get(Uri.parse("$baseUrl/fit-for-all?category=$category"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data["products"] != null && data["products"].isNotEmpty) {
//           return List<Map<String, dynamic>>.from(data["products"]);
//         }
//       }
//       return _dummyFitForAll(category);
//     } catch (e) {
//       return _dummyFitForAll(category);
//     }
//   }
//   // ---------------------- Dummy fallbacks ----------------------

//   static List<Map<String, String>> _dummyBanners(String category) {
//   if (category == "men") {
//     return [
//       {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/rashuuuuu_jY3O3bx.jpg?w=768&dpr=2"},
//       {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/App_Banner_BW-WHITE_BDSJDez.jpg?w=768&dpr=2"},
//       {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/mobile_19_8eckstT.jpg?w=768&dpr=2"},
//     ];
//   } else if (category == "women") {
//     return [
//       {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/hp_StTEBXJ.jpg?w=1500&dpr=1.3"},
//       {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/app_ban2.1_Wvcgoku.jpg?w=768&dpr=2"},
//       {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/shoes_app_1_fklQFgY.jpg?w=768&dpr=2"},
//     ];
//   } 
//    else if (category == "sneakers") {
//     return [
//       {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/app_ban_1_E1UC9rQ.jpg?w=768&dpr=2"},
//       {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/AppBanner_chXRsPi.jpg?w=768&dpr=2"},
//       {"image":"https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/friends_sneaker_app_gyQLYXT_EA1d5bg.png?w=768&dpr=2"}
//     ];
//   }
//   return [];
// }
// // NEW: Proper dummy data for dynamic sections

// static List<Map<String, dynamic>> _dummyPackItUp() {
//   return [
//     {
//       "id": "1",
//       "name": "Travel Backpack Pro",
//       "category": "Bags & Backpacks",
//       "price": "2499",
//       "image": "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "2",
//       "name": "Weekender Duffle Bag",
//       "category": "Travel Bags",
//       "price": "3299",
//       "image": "https://images.unsplash.com/photo-1491637639811-60e2756cc1c7?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "3",
//       "name": "Compact Gym Bag",
//       "category": "Sports Bags",
//       "price": "1799",
//       "image": "https://images.unsplash.com/photo-1547949003-9792a18a2601?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "4",
//       "name": "Canvas Tote Bag",
//       "category": "Everyday Bags",
//       "price": "899",
//       "image": "https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=400&h=500&fit=crop",
//     },
//   ];
// }

// static List<Map<String, dynamic>> _dummyEarlyWinterDrops() {
//   return [
//     {
//       "id": "1",
//       "name": "Wool Blend Overcoat",
//       "category": "Winter Coats",
//       "price": "4999",
//       "image": "https://images.unsplash.com/photo-1539533018447-63fcce2678e3?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "2",
//       "name": "Puffer Jacket - Navy",
//       "category": "Jackets",
//       "price": "3499",
//       "image": "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "3",
//       "name": "Thermal Hoodie",
//       "category": "Hoodies & Sweatshirts",
//       "price": "1999",
//       "image": "https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "4",
//       "name": "Knitted Sweater",
//       "category": "Sweaters",
//       "price": "2499",
//       "image": "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400&h=500&fit=crop",
//     },
//   ];
// }

// static List<Map<String, dynamic>> _dummyCraftedWithIntent() {
//   return [
//     {
//       "id": "1",
//       "name": "Artisan Leather Wallet",
//       "category": "Accessories",
//       "price": "1299",
//       "image": "https://images.unsplash.com/photo-1627123424574-724758594e93?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "2",
//       "name": "Hand-Stitched Belt",
//       "category": "Belts",
//       "price": "899",
//       "image": "https://images.unsplash.com/photo-1624222247344-67d90e4d30c4?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "3",
//       "name": "Minimalist Watch",
//       "category": "Watches",
//       "price": "3999",
//       "image": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=500&fit=crop",
//     },
//     {
//       "id": "4",
//       "name": "Organic Cotton Tee",
//       "category": "Sustainable Fashion",
//       "price": "1199",
//       "image": "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=500&fit=crop",
//     },
//   ];
// }
//   // NEW: Dummy Markdowns data (clearance/sale items)
//   static List<Map<String, dynamic>> _dummyMarkdowns() {
//   return [
//     {
//       "id": "1",
//       "category": "OFFICIAL\nMERCH",
//       "subtitle": "CLEARANCE",
//       "image": "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400&h=600&fit=crop",
//       "badge": "CLEARANCE",
//     },
//     {
//       "id": "2",
//       "category": "SHIRTS",
//       "subtitle": "CLEARANCE",
//       "image": "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400&h=600&fit=crop",
//       "badge": "CLEARANCE",
//     },
//     {
//       "id": "3",
//       "category": "JACKETS",
//       "subtitle": "WINTER SALE",
//       "image": "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&h=600&fit=crop",
//       "badge": "50% OFF",
//     },
//     {
//       "id": "4",
//       "category": "ACCESSORIES",
//       "subtitle": "LIMITED STOCK",
//       "image": "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=600&fit=crop",
//       "badge": "CLEARANCE",
//     },
//   ];
// }

//   // NEW: Dummy Shop For Categories (large category tiles)
//   static List<Map<String, dynamic>> _dummyShopForCategories() {
//     return [
//       {
//         "id": "1",
//         "name": "ACCESSORIES",
//         "image": "https://picsum.photos/600/800?random=120",
//         "subtitle": "Complete Your Look",
//       },
//       {
//         "id": "2",
//         "name": "WOMEN'S COLLECTION",
//         "image": "https://picsum.photos/600/800?random=121",
//         "subtitle": "Explore Latest Trends",
//       },
//     ];
//   }

//  static List<Map<String, dynamic>> _dummyCategories(String category) {
//   if (category == "men") {
//     return [
//       {"id": "1", "name": "T-SHIRTS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/5_6_z4fRtnN.jpg?w=480&dpr=2"},
//       {"id": "2", "name": "SHIRTS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/jacket_uNDP2Mq.jpg?w=480&dpr=2"},
//       {"id": "3", "name": "JEANS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/8_3_ikwMNmz.jpg?w=480&dpr=2"},
//       {"id": "4", "name": "JACKETS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_7_uBOklwH.jpg?w=480&dpr=2"},
//     ];
//   } else if (category == "women") {
//     return [
//       {"id": "1", "name": "DRESSES", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/tshirts_rCXevzh.jpg?w=480&dpr=2"},
//       {"id": "2", "name": "TOPS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/shirts_wUyCmmA.jpg?w=480&dpr=2"},
//       {"id": "3", "name": "SKIRTS", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/tshirts_Kbpk562.jpg?w=480&dpr=2"},
//       {"id": "4", "name": "ACCESSORIES", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Big_Polos_3_xTXnFYJ.jpg?w=480&dpr=2"},
    
//   ];
//   }
//   // else if (category == "sneakers") {
//   //   return [
//   //     {"id": "1", "name": "RUNNING SHOES", "image": "https://picsum.photos/300/400?random=40"},
//   //     {"id": "2", "name": "CASUAL SHOES", "image": "https://picsum.photos/300/400?random=41"},
//   //     {"id": "3", "name": "HIGH TOPS", "image": "https://picsum.photos/300/400?random=42"},
//   //     {"id": "4", "name": "SPORTS SANDALS", "image": "https://picsum.photos/300/400?random=43"},
//   //   ];
//   // }

//   // Default empty list
//   return [];
// }
// static List<Map<String, dynamic>> _dummyNewArrivals(String category) {
//   if (category == "men") {
//     return [
//       {
//         "id": "1",
//         "name": "Souled: Outlast",
//         "category": "Men Low Top Sneakers",
//         "price": "2599",
//         "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760509604_2781851.jpg?w=360&dpr=2",
      
//       },
//       {
//         "id": "2",
//         "name": "Punisher: Justice",
//         "category": "Jackets",
//         "price": "2599",
//         "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760425639_1365852.jpg?w=360&dpr=2",
//       },
//       {
//         "id": "3",
//         "name": "Oversized T-Shirt: Gothic Buildings",
//         "category": "Oversized T-Shirts",
//         "price": "999",
//         "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760427917_6056717.jpg?w=360&dpr=2",},
//     ];
//   } else if (category == "women") {
//     return [
//       {
//         "id": "1",
//         "name": "Floral Maxi Dress",
//         "category": "Dresses",
//         "price": "9",
//         "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760427917_6056717.jpg?w=360&dpr=2",
//         "badge": "NEW ARRIVAL",
//       },
//       {
//         "id": "2",
//         "name": "Silk Blouse",
//         "category": "Tops",
//         "price": "799",
//         "image": "https://picsum.photos/400/500?random=21",
//         "badge": "NEW ARRIVAL",
//       },
//     ];
//   } 
//   // else if (category == "sneakers") {
//   //   return [
//   //     {
//   //       "id": "1",
//   //       "name": "Air Zoom Sneaker",
//   //       "category": "Running Shoes",
//   //       "price": "3499",
//   //       "image": "https://picsum.photos/400/500?random=30",
//   //       "badge": "LIMITED EDITION",
//   //     },
//   //     {
//   //       "id": "2",
//   //       "name": "Retro High Tops",
//   //       "category": "Casual Shoes",
//   //       "price": "3999",
//   //       "image": "https://picsum.photos/400/500?random=31",
//   //       "badge": "BEST SELLER",
//   //     },
//   //   ];
//   // }

//   // Default empty list
//   return [];
// }

//   static List<Map<String, dynamic>> _dummyTopPicks(String category) {
//     if (category == 'men') {
//       return [
//         {"id": "1", "name": "Cotton Linen: Midnight Black", "category": "Cotton Linen Shirts", "price": "1499", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/1_5_dDuJ1GM.jpg?w=360&dpr=2"},
//         {"id": "2", "name": "Korean Joggers: Off White", "category": "Joggers", "price": "1749", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2_6_OpEtw4Y.jpg?w=360&dpr=2"},
//       {"id": "3", "name": "", "category": "Sweaters", "price": "1999", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_5_QtAHjom.jpg?w=360&dpr=2"},
      
//       ];
//     }
//     else if (category == 'women') {
//     return [
//       {"id": "1", "name": "Demon Slayer: Zenitsu", "category": "Oversized T-Shirts", "price": "999", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2_6_OpEtw4Y.jpg?w=360&dpr=2"},
//       {"id": "2", "name": "Mortal Kombat: Scorpion", "category": "Sneakers", "price": "3499", "image": "https://picsum.photos/400/500?random=31"},
//     ];
//   }
//     return [];
//   }

//   static List<Map<String, dynamic>> _dummyCraftedItems(String category) {
//     if (category == "men") {
//       return [
//         {"id": "1", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Collection_Tile_1Artboard_1.jpg?w=480&dpr=2"},
      
//         {"id": "2", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Collection_Tile_1Artboard_2.jpg?w=480&dpr=2"},
//       {"id": "3", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Collection_Tile_1Artboard_3.jpg?w=480&dpr=2"},
//       ];
//     } else if (category == "women") {
//       return [
//         {"id": "1", "image": "https://picsum.photos/800/400?random=42"},
//         {"id": "2", "image": "https://picsum.photos/800/400?random=43"},
//       ];
//     }
//     return [];
//   }

//   static List<Map<String, dynamic>> _dummyOfficeEdits() {
//     return [
//       {
//         "id": "1",
//         "name": "Formal Slim Fit Shirt",
//         "category": "Office Wear",
//         "price": "1499",
//         "image": "https://picsum.photos/400/500?random=50",
//         "badge": "BESTSELLER",
//       },
//       {
//         "id": "2",
//         "name": "Classic Formal Trousers",
//         "category": "Office Wear",
//         "price": "1999",
//         "image": "https://picsum.photos/400/500?random=51",
//         "badge": "NEW",
//       },
//     ];
//   }



  
// // Dummy data
// static List<Map<String, dynamic>> _dummyOfficialCollabs() {
//   return [
//     {
//       "id": "1",
//       "name": "Muichiro Tokito Tee",
//       "category": "Official Collab",
//       "price": "1299",
//       "image": "https://picsum.photos/400/500?random=70",
//       "badge": "DEMON SLAYER"
//     },
//     {
//       "id": "2",
//       "name": "Spider-Man Venom Tee",
//       "category": "Official Collab",
//       "price": "1399",
//       "image": "https://picsum.photos/400/500?random=71",
//       "badge": "MARVEL"
//     },
//   ];
// }

// static List<Map<String, dynamic>> _dummyFandomHiddenGems() {
//   return [
//     {
//       "id": "1",
//       "name": "Uchiha Sasuke Tee",
//       "category": "Fandom Hidden Gems",
//       "price": "1199",
//       "image": "https://picsum.photos/400/500?random=80",
//       "badge": "ANIME"
//     },
//     {
//       "id": "2",
//       "name": "The Punisher Tee",
//       "category": "Fandom Hidden Gems",
//       "price": "1299",
//       "image": "https://picsum.photos/400/500?random=81",
//       "badge": "MARVEL"
//     },
//   ];
// }
//  static List<Map<String, dynamic>> _dummySneakersDen() {
//     return [
//       {
//         "id": "1",
//         "name": "Urban Blaze",
//         "image": "https://picsum.photos/600/700?random=90",
//         "badge": "THE SOULED STORE\nSNEAKER\nDIVISION",
//         "title": "URBAN BLAZE",
//         "subtitle": "THE CULT FAVOURITE SILHOUETTE"
//       },
//       {
//         "id": "2",
//         "name": "Functional Classic",
//         "image": "https://picsum.photos/600/700?random=91",
//         "badge": "THE SOULED STORE\nSNEAKER\nDIVISION",
//         "title": "FUNCTIONAL CLASSIC",
//         "subtitle": "PREMIUM COMFORT & STYLE"
//       },
//     ];
//   }

//   static List<Map<String, dynamic>> _dummySupimaTees() {
//     return [
//       {
//         "id": "1",
//         "name": "White Supima Tee",
//         "image": "https://picsum.photos/600/700?random=100",
//         "description": null,
//       },
//       {
//         "id": "2",
//         "name": "Premium Supima Tee",
//         "image": "https://picsum.photos/600/700?random=101",
//         "description": "Sourced from The World's Finest Supima Cotton, This offers Best-in-Class Comfort, Durability, and Vibrance.",
//       },
//     ];
//   }
// static List<Map<String, dynamic>> _dummyFitForAll(String category) {
//   if (category == "men") {
//     return [
//       {
//         "id": "1",
//         "name": "Men's Oversized Tee",
//         "category": "Oversized T-Shirts",
//         "price": "899",
//         "image": "https://picsum.photos/400/500?random=10",
//         "badge": "OVERSIZED FIT",
//       },
//       {
//         "id": "2",
//         "name": "Everybody Croaks",
//         "category": "Oversized T-Shirts",
//         "price": "899",
//         "image": "https://picsum.photos/400/500?random=11",
//         "badge": "OVERSIZED FIT",
//       },
//     ];
//   } else if (category == "women") {
//     return [
//       {
//         "id": "1",
//         "name": "Floral Maxi Dress",
//         "category": "Dresses",
//         "price": "1299",
//         "image": "https://picsum.photos/400/500?random=20",
//         "badge": "NEW ARRIVAL",
//       },
//       {
//         "id": "2",
//         "name": "Silk Blouse",
//         "category": "Tops",
//         "price": "799",
//         "image": "https://picsum.photos/400/500?random=21",
//         "badge": "NEW ARRIVAL",
//       },
//     ];
//   } 
//   // else if (category == "sneakers") {
//   //   return [
//   //     {
//   //       "id": "1",
//   //       "name": "Air Zoom Sneaker",
//   //       "category": "Running Shoes",
//   //       "price": "3499",
//   //       "image": "https://picsum.photos/400/500?random=30",
//   //       "badge": "LIMITED EDITION",
//   //     },
//   //     {
//   //       "id": "2",
//   //       "name": "Retro High Tops",
//   //       "category": "Casual Shoes",
//   //       "price": "3999",
//   //       "image": "https://picsum.photos/400/500?random=31",
//   //       "badge": "BEST SELLER",
//   //     },
//   //   ];
//   // }

//   // Default empty list
//   return [];
// }
  static List<Map<String, dynamic>> _dummyTrendingMerch(String category) {
  if (category == "men") {
    return [
      {
        "id": "1",
        "name": "Marvel Avengers Tee",
        "category": "Trending Merch",
        "price": "1299",
        "image": "https://picsum.photos/400/500?random=60",
        "badge": "HOT",
      },


    ];
  } else if (category == "women") {
    return [
      {
        "id": "1",
        "name": "Wonder Woman Graphic Tee",
        "category": "Trending Merch",
        "price": "1299",
        "image": "https://picsum.photos/400/500?random=62",
        "badge": "HOT",
      },
    
    ];
  }
  return [];
}
}