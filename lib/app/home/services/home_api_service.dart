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

  static Future<List<Map<String, dynamic>>> fetchEarlyWinterDrops({String category = "general"}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/early-winter-drops?category=$category"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyEarlyWinterDrops(category);
    } catch (e) {
      return _dummyEarlyWinterDrops(category);
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
static Future<List<Map<String, dynamic>>> fetchCuratedForYou({String category = "general"}) async {
  try {
    final response = await http.get(Uri.parse("$baseUrl/curated-merch?category=$category"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["products"] != null && data["products"].isNotEmpty) {
        return List<Map<String, dynamic>>.from(data["products"]);
      }
    }
    return _dummyCuratedForYou(category);
  } catch (e) {
    return _dummyCuratedForYou(category);
  }
}

static List<Map<String, dynamic>> _dummyCuratedForYou(String category) {
  if (category == "men") {
    return [
      {
        "id": "1",
        "name": "Minimalist Cotton Tee",
        "category": "Curated Merch",
        "price": "1499",
        "image": "https://picsum.photos/400/500?random=71",
        "badge": "NEW",
      },
    ];
  } else if (category == "women") {
    return [
      {
        "id": "1",
        "name": "Elegant Summer Dress",
        "category": "Curated Merch",
        "price": "1999",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/appbanner_kIbIiiU.jpg?w=768&dpr=2",
        "badge": "NEW",
      },
    ];
  }
  return [];
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
    static Future<List<Map<String, dynamic>>> fetchHearItFrom() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/hear-it-from"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyHearItFromss();
    } catch (e) {
      return _dummyHearItFromss();
    }
  }
    static Future<List<Map<String, dynamic>>> fetchWhatMakeUs() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/what-makes-us"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyWhatMakesUs();
    } catch (e) {
      return _dummyWhatMakesUs();
    }
  }
    static Future<List<Map<String, dynamic>>> fetchFreshOutTheLab() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/fresh-out-the-lab"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyfreshOutTheLab();
    } catch (e) {
      return _dummyfreshOutTheLab();
    }
  }
    static Future<List<Map<String, dynamic>>> fetchBestInUbz() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/best-in-ubz"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyBestInUbz();
    } catch (e) {
      return _dummyBestInUbz();
    }
  }
  static Future<List<Map<String, dynamic>>> fetchBackOnPopularDemand() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/back-on-popular-demand"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyBackOnPopularDemand();
    } catch (e) {
      return _dummyBackOnPopularDemand();
    }
  }
   static Future<List<Map<String, dynamic>>> fetchSneakersForHer() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/sneakers-for-her"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummySneakerForHer();
    } catch (e) {
      return _dummySneakerForHer();
    }
  }
   static Future<List<Map<String, dynamic>>> fetchBestInReverb() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/best-in-reverb"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyBestInReverb();
    } catch (e) {
      return _dummyBestInReverb();
    }
  }
     static Future<List<Map<String, dynamic>>> fetchBestInFumes() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/best-in-fumes"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyBestInFumes();
    } catch (e) {
      return _dummyBestInFumes();
    }
  }
     static Future<List<Map<String, dynamic>>> fetchTheLaceEdit() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/the-lace-edit"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummyTheLaceEdit();
    } catch (e) {
      return _dummyTheLaceEdit();
    }
  }
     static Future<List<Map<String, dynamic>>> fetchSockItUp() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/sock-it-up"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["products"] != null && data["products"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["products"]);
        }
      }
      return _dummySockItUp();
    } catch (e) {
      return _dummySockItUp();
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

 static Future<List<Map<String, dynamic>>> fetchMostLoveddesign() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/shop-for"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["categories"] != null && data["categories"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["categories"]);
        }
      }
      return _dummyMostLovedDesign();
    } catch (e) {
      return _dummyMostLovedDesign();
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
  static Future<List<Map<String, String>>> fetchSneakersSecondBanner() async {
  try {
    final response = await http.get(Uri.parse("$baseUrl/banners?category=sneakers_second"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["banners"] != null && data["banners"].isNotEmpty) {
        return List<Map<String, String>>.from(data["banners"]);
      }
    }
    return _dummySneakersSecondBanner();
  } catch (e) {
    return _dummySneakersSecondBanner();
  }
}

static List<Map<String, String>> _dummySneakersSecondBanner() {
  return [
    {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/Vanguard_homepage_1ZCgRJg.jpg?w=1500&dpr=2"},
    {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/homepage_3_RKaOT7Y.jpg?w=1500&dpr=2"},
    {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/hompegae_dWpTVZU.jpg?w=1500&dpr=2"},
  ];
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
 static List<Map<String, dynamic>> _dummyfreshOutTheLab() {
    return [
      {
        "id": "1",
        "name": "Milano: Walnut",
        "category": "Sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Top-souled-pick-top-selling-tiles-1_iLcwcFl.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "Souled: Outlast",
        "category": "Sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/1_1_9wFxhG8.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Velocity: Cobalt",
        "category": "Sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_3_1_92NbfLZ.jpg?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Hydros: Harry Potter Bravery",
        "category": "Sneakers",
        "price": "1499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/9_2_y3WOuID.jpg?w=360&dpr=2",
      },
    ];
  }
  static List<Map<String, dynamic>> _dummyBackOnPopularDemand() {
    return [
      {
        "id": "1",
        "name": "Urban Blaze: Mocha",
        // "category": "Bags & Backpacks",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/0_pywvJKJ.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "Velocity: Scarlet",
        "category": "Sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_2_OusWKHV.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Hydros: Ghostbusters",
        "category": "Footwear",
        "price": "1499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_6_rJAQVLh.jpg?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Urban Blaze: Hawkins",
         "category": "sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2_E4wQk8M.jpg?w=360&dpr=2",
      },
    ];
  }
  static List<Map<String, dynamic>> _dummyBestInUbz() {
    return [
      {
        "id": "1",
        "name": "Urban Blaze: Cappuccino",
        "category": "Sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_2_1_iLVve8I.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "UBZ Legacy: Belgian Chocolate",
        "category": "Shoes",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_6_YyZrVxA.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Urban Blaze: Tokyo",
        "category": "Sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_3_WK3MbwF.jpg?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Urban Blaze: Mafia",
        "category": "sneakers",
        "price": "2499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/5_4_npRaJON.jpg?w=360&dpr=2",
      },
    ];
  }
   static List<Map<String, dynamic>> _dummySockItUp() {
    return [
      {
        "id": "1",
        "name": "Souled Socks: Santra",
        "category": "Socks",
        "price": "299",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/ts1_XJy1TLw.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "Souled Socks: Tarbooj",
        "category": "Socks",
        "price": "299",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/ts2.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "TSS Originals:  Kanji",
        "category": "Socks",
        "price": "299",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/ts3_uuZSWWN.jpg?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Peanuts: Snoopy",
        "category": "Socks",
        "price": "299",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/ts4_sfhIQO1.jpg?w=360&dpr=2",
      },
    ];
  }
   static List<Map<String, dynamic>> _dummyTheLaceEdit() {
    return [
      {
        "id": "1",
        "name": "Signature Laces : Crimson Red",
        "category": "Shoe Laces",
        "price": "199",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_4_Lb5XK2W.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "Signature Laces : Shadow Crest",
        "category": "Shoes",
        "price": "199",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2_4_vIkfPEU.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Signature Laces : Dusk",
        "category": "Shoe Laces",
        "price": "199",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/8_1_HeHs2oz.jpg?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Signature Laces : Whirlpool",
        "category": "shoe laces",
        "price": "199",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/7_1_bjutPjI.jpg?w=360&dpr=2",
      },
    ];
  }
   static List<Map<String, dynamic>> _dummyBestInFumes() {
    return [
      {
        "id": "1",
        "name": "Fumes NX: Oasis",
        "category": "sneakers",
        "price": "3499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_8_y1CFdoL.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "Fumes: Storm",
        "category": "sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Top-souled-pick-top-selling-tiles_1v0n4SK.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Fumes NX: Shadow",
        "category": "sneakers",
        "price": "1799",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_5_TNPABy8.jpg?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Fumes: Eclipse",
        "category": "sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Top-souled-pick-top-selling-tiles1_fF7IXen.jpg?w=360&dpr=2",
      },
    ];
  }

   static List<Map<String, dynamic>> _dummyBestInReverb() {
    return [
      {
        "id": "1",
        "name": "Reverb: Mocha",
        "category": "sneakers",
        "price": "2499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_4_2_L97q8Cn.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "Reverb:  Azure",
        "category": "sneakers",
        "price": "1849",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_5_1_u4rW5RT.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Reverb: Sandstorm",
        "category": "sneakers",
        "price": "2299",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_2_2_84zJgbv.jpg?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Reverb: Neon Black",
        "category": "sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_1_2_lCn6d0c.jpg?w=360&dpr=2",
      },
    ];
  }

 static List<Map<String, dynamic>> _dummySneakerForHer() {
    return [
      {
        "id": "1",
        "name": "Milano: Bloom",
        "category": "sneakers",
        "price": "2499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/top_selling_2_3tk9bOH.jpg?w=360&dpr=2",
      },
      {
        "id": "2",
        "name": "Milano: Cloud",
        "category": "sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/top_selling_1_1_eVrbBpP.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Hello Kitty: Kawaii",
        "category": "sneakers",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Artboard_5_p9PNyhr.png?w=360&dpr=2",
      },
      {
        "id": "4",
        "name": "Urban Blaze: FRIENDS",
        "category": "sneaker",
        "price": "2599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/20_1_Wbcz61o.jpg?w=360&dpr=2",
      },
    ];
  }
// Replace the _dummyEarlyWinterDrops function in your ApiService

static List<Map<String, dynamic>> _dummyEarlyWinterDrops(String category) {
  if (category == "men") {
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
  } else if (category == "women") {
    return [
      {
        "id": "1",
        "name": "Knitted Sweater: Blushwood",
        "category": "Sweaters",
        "price": "1999",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Top_souled_pick_top_selling_tiles_1_copy_iLHM1B9.jpg?w=360&dpr=2"
      },
      {
        "id": "2",
        "name": "Harry Potter: Hogwarts",
        "category": "Jackets",
        "price": "3599",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/TTT_9_NxpPv0A.jpg?w=360&dpr=2",
      },
      {
        "id": "3",
        "name": "Textured Sweater: Heather",
        "category": "Sweaters",
        "price": "1999",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/TTT_2_SLFWQjq.jpg?w=360&dpr=2"
      },
    ];
  }
  return [];
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
    static List<Map<String, dynamic>> _dummyMostLovedDesign() {
    return [
      {
        "id": "1",
        "name": "ACCESSORIES",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/1.1_yywKck4.jpg?w=480&dpr=2",
        "subtitle": "Complete Your Look",
      },
      {
        "id": "2",
        "name": "WOMEN'S COLLECTION",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2.2_pmw1CBQ.jpg?w=480&dpr=2",
        "subtitle": "Explore Latest Trends",
      },
      {
        "id":"3",
        "name": "WOMEN'S COLLECTION",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3.3_I2voO7a.jpg?w=480&dpr=2",
        "subtitle": "Explore Latest Trendssss",
      }
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
    else if (category == "sneakers") {
      return [
        {"id": "1", "name": "men footwear", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/1b_UUeLd9v.jpg?w=480&dpr=2"},
        {"id": "2", "name": "WOMEN'S FOOTWEAR", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2b_bcGZoNw.jpg?w=480&dpr=2"},
        {"id": "3", "name": "official collab", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/5b_AR9QEfm.jpg?w=480&dpr=2"},
        {"id": "4", "name": "All high tops", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/4b_gkZ2Pi8.jpg?w=480&dpr=2"},
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
          "name": "Hello Kitty: Pink Bow",
          "category": "Women Oversized T-Shirts",
          "price": "999",
          "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760616377_9124059.jpg?w=360&dpr=2"
        },
        {
          "id": "2",
          "name": "Biker Jacket: Soulful",
          "category": "Women Jackets",
          "price": "3499",
          "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760433975_2216758.jpg?w=360&dpr=2",
        },
        {
          "id": "3",
          "name": "Gelato: Rose",
          "category": "Women Low Top Sneakers",
          "price": "2599",
          "image": "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1760692225_3155060.jpg?w=360&dpr=2",
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
        {"id": "1", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/tshirts_PqnMx4I.jpg?w=480&dpr=2"},
        {"id": "2", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/shirts_aRqhBON.jpg?w=480&dpr=2"},
        {"id": "3", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/tshirts_OaOvNtn.jpg?w=480&dpr=2"},
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
static List<Map<String, dynamic>> _dummyHearItFromss() {
    return [
      {
        "id": "1",
        "name": "Urban Blaze",
        "category": "Sneakers",
        "price": "2999",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/1_Q9q7nGv.jpg?w=480&dpr=2",
        
      },
      {
        "id": "2",
        "name": "Functional Classic",
        "category": "Sneakers",
        "price": "3499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2_LBk29uh.jpg?w=480&dpr=2",
      },
      {
        "id": "3",
        "name": "Sporty Vibes",
        "category": "Sneakers",
        "price": "2799",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_uXZfMcz.jpg?w=480&dpr=2",
      },
    ];
  }
  static List<Map<String, dynamic>> _dummyWhatMakesUs() {
    return [
      {
        "id": "1",
        "name": "Urban Blaze",
        "category": "Sneakers",
        "price": "2999",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/1_2_uBj91Iu.jpg?w=480&dpr=2",
      },
      {
        "id": "2",
        "name": "Functional Classic",
        "category": "Sneakers",
        "price": "3499",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2_2_U2Ca5Te.jpg?w=480&dpr=2",
      },
      {
        "id": "3",
        "name": "Sporty Vibes",
        "category": "Sneakers",
        "price": "2799",
        "image": "vhttps://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_2_cIpsSDd.jpg?w=480&dpr=2",
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

  static List<Map<String, dynamic>> _dummyTopPicks(String category) {
    if (category == 'men') {
      return [
        {"id": "1", "name": "Cotton Linen: Midnight Black", "category": "Cotton Linen Shirts", "price": "1499", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/1_5_dDuJ1GM.jpg?w=360&dpr=2"},
        {"id": "2", "name": "Korean Joggers: Off White", "category": "Joggers", "price": "1749", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/2_6_OpEtw4Y.jpg?w=360&dpr=2"},
      {"id": "3", "name": "", "category": "Sweaters", "price": "1999", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/3_5_QtAHjom.jpg?w=360&dpr=2"},
      
      ];
    }
    else if (category == 'women') {
    return [
      {"id": "1", "name": "Demon Slayer: High-Neck Sweater: Soft Sage", "category": "Sweaters", "price": "1799", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Netflix_tile1.jpg?w=360&dpr=2"},
      {"id": "2", "name": "Slit T-Shirt: Karma", "category": "Oversized T-Shirts", "price": "1199", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Netflix_tile_2_YKdmt3N.jpg?w=360&dpr=2"},
    {"id": "3", "name": "Embroidered Shirt: Magnolia", "category": "Shirt", "price": "1749", "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/product-images/Netflix_tile_3_02Mecss.jpg?w=360&dpr=2"},
    ];
  }
    return [];
  }
    static Future<List<Map<String, dynamic>>> fetchTopPicks({String category = "general"}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/top-picks?category=$category"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["items"] != null && data["items"].isNotEmpty) {
          return List<Map<String, dynamic>>.from(data["items"]);
        }
      }
      return _dummyTopPicks(category);
    } catch (e) {
      return _dummyTopPicks(category);
    }
  }
// }
  static List<Map<String, dynamic>> _dummyTrendingMerch(String category) {
  if (category == "men") {
    return [
      {
        "id": "1",
        "name": "Marvel Avengers Tee",
        "category": "Trending Merch",
        "price": "1299",
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/Gelato---sneakers.jpg?w=768&dpr=2",
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
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/Gelato---sneakers.jpg?w=768&dpr=2",
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
        "image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/Gelato---sneakers.jpg?w=768&dpr=2",
        "badge": "HOT",
      },

    ];
  }
  return [];
}




  // Fetch women dynamic data
  static Future<List<Map<String, dynamic>>> fetchWomenDynamicData(String title) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/women/dynamic?title=$title'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // If API returns empty list or null, fallback to dummy
        if (data == null || data.isEmpty) {
          print("API empty, using dummy data for: $title");
          return _dummyfetchWomenDynamicData(title);
        }

        // Expecting data to be a list of maps
        return List<Map<String, dynamic>>.from(data);
      } else {
        print("API error ${response.statusCode}, using dummy data for: $title");
        return _dummyfetchWomenDynamicData(title);
      }
    } catch (e) {
      print("Error fetching women dynamic data: $e");
      // Fallback when network or decoding fails
      return _dummyfetchWomenDynamicData(title);
    }
  }

  // -------------------- DUMMY DATA --------------------

  static List<Map<String, dynamic>> _dummyfetchWomenDynamicData(String title) {
    switch (title.toLowerCase()) {
      case "bottom line denim":
        return [
          {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/joggers-app_gG5KiLl.jpg?w=768&dpr=2"},
        ];
      case "house of linen":
        return [
          {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/Hello-Kitty-app-banner-_HgcxF1G.jpg?w=768&dpr=2"},
        ];
      case "style meets comfort":
        return [
          {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/App-Banner-4_IE9oB7R.jpg?w=768&dpr=2"},
        ];
      case "the chill girl edit":
        return [
          {"image": "https://prod-img.thesouledstore.com/public/theSoul/storage/mobile-cms-media-prod/banner-images/App-banner-final_3Qdmjwq.jpg?w=768&dpr=2"},
        ];
      default:
        return [];
    }
  }
}
