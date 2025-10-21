
import 'package:fashion_store/app/home/services/home_api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var menBanners = [].obs;
  var womenBanners = [].obs;
  var sneakersBanners = [].obs;
  var menNewArrivals = [].obs;
  var womenNewArrivals = [].obs;
  var menFitForAll = [].obs;
  var womenFitForAll = [].obs;

//  var newArrivals = [].obs;
  var mencategories = [].obs;
  var womencategories = [].obs;

  var menTopPicks = [].obs;
  var womenTopPicks = [].obs;
    //var topPicks = [].obs;
  var menCraftedItems = [].obs;
  var womenCraftedItems = [].obs;

   var officeEdits = [].obs;
var menTrendingMerch = [].obs;
var womenTrendingMerch = [].obs;
var onceBannerImage = [].obs;
var officialCollabs = [].obs;
var fandomHiddenGems = [].obs;
  var sneakersDen = [].obs;
  var supimaTees = [].obs;
    var markdowns = [].obs;
  var shopForCategories = [].obs;
  final RxList<dynamic> packItUp = <dynamic>[].obs;
  final RxList<dynamic> earlyWinterDrops = <dynamic>[].obs;
  final RxList<dynamic> craftedWithIntent = <dynamic>[].obs;
 final RxMap<String, RxList<dynamic>> sections = <String, RxList<dynamic>>{}.obs;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading(true);
      
      // Load both banners and new arrivals in parallel
      await Future.wait([
        loadBanners(),
        loadNewArrivals(),
        loadFitForAll(),
        loadCategories(),
         loadAllSections(),
        loadCraftedItems(),
         loadOfficeEdits(),
  loadTrendingMerch(),
  loadOfficialCollabs(),
  loadFandomHiddenGems(),
    loadSneakersDen(),
        loadSupimaTees(),
          loadMarkdowns(),
        loadShopForCategories(),
      ]);
    } finally {
      isLoading(false);
    }
  }
 Future<void> loadAllSections() async {
    try {
      packItUp.value = await ApiService.fetchPackItUp();
      earlyWinterDrops.value = await ApiService.fetchEarlyWinterDrops();
      craftedWithIntent.value = await ApiService.fetchCraftedWithIntent();

      // connect title to each section
      sections.addAll({
        'pack it up': packItUp,
        'early winter drops': earlyWinterDrops,
        'crafted with intent': craftedWithIntent,
      });
    } catch (e) {
      print('Error loading sections: $e');
    }
  }
  Future<void> loadBanners() async {
    try {
      menBanners.value = await ApiService.fetchBanners(category:"men");
       womenBanners.value = await ApiService.fetchBanners(category: "women");
      sneakersBanners.value = await ApiService.fetchBanners(category: "sneakers");

    } catch (e) {
      print('Error loading banners: $e');
    }
  }

  Future<void> loadNewArrivals() async {
    try {
      menNewArrivals.value = await ApiService.fetchNewArrivals(category: "men");
      womenNewArrivals.value = await ApiService.fetchNewArrivals(category: "women");
    } catch (e) {
      print('Error loading new arrivals: $e');
    }
  }
  Future<void> loadCategories() async {
    try {
      mencategories.value = await ApiService.fetchCategories(category: "men");
      womencategories.value = await ApiService.fetchCategories(category: "women");
    } catch (e) {
      print('Error loading categories: $e');
    }
  }
  //   Future<void> loadTopPicks() async {
  //   try {
  //     menTopPicks.value = await ApiService.fetchTopPicks(category: "men");
  //     womenTopPicks.value = await ApiService.fetchTopPicks(category: "women");
  //   } catch (e) {
  //     print('Error loading top picks: $e');
  //   }
  // }
 
  Future<void> loadCraftedItems() async {
    try {
      menCraftedItems.value = await ApiService.fetchCraftedItems(category: "men");
      womenCraftedItems.value = await ApiService.fetchCraftedItems(category: "women");
    } catch (e) {
      print('Error loading crafted items: $e');
    }
  }
Future<void> loadOfficeEdits() async {
  try {
    officeEdits.value = await ApiService.fetchOfficeEdits();
  } catch (e) {
    print("Error loading office edits: $e");
  }
}

Future<void> loadTrendingMerch() async {
  try {
    menTrendingMerch.value = await ApiService.fetchTrendingMerch(category: "men");
    womenTrendingMerch.value = await ApiService.fetchTrendingMerch(category: "women");
  } catch (e) {
    print("Error loading trending merch: $e");
  }
}

Future<void> loadOfficialCollabs() async {
  try {
    officialCollabs.value = await ApiService.fetchOfficialCollabs();
  } catch (e) {
    print("Error loading official collabs: $e");
  }
}

Future<void> loadFandomHiddenGems() async {
  try {
    fandomHiddenGems.value = await ApiService.fetchFandomHiddenGems();
  } catch (e) {
    print("Error loading fandom hidden gems: $e");
  }
}

  Future<void> loadSneakersDen() async {
    try {
      sneakersDen.value = await ApiService.fetchSneakersDen();
    } catch (e) {
      print("Error loading sneakers den: $e");
    }
  }

  Future<void> loadSupimaTees() async {
    try {
      supimaTees.value = await ApiService.fetchSupimaTees();
    } catch (e) {
      print("Error loading supima tees: $e");
    }
  }

// NEW: Load Markdowns
  Future<void> loadMarkdowns() async {
    try {
      markdowns.value = await ApiService.fetchMarkdowns();
    } catch (e) {
      print('Error loading markdowns: $e');
    }
  }

  // NEW: Load Shop For Categories
  Future<void> loadShopForCategories() async {
    try {
      shopForCategories.value = await ApiService.fetchShopForCategories();
    } catch (e) {
      print('Error loading shop for categories: $e');
    }
  }


  
  Future<void> loadFitForAll() async {
    try {
      menFitForAll.value = await ApiService.fetchFitForAll(category: "men");
      womenFitForAll.value = await ApiService.fetchFitForAll(category: "women");
    } catch (e) {
      print('Error loading fit for all: $e');
    }
  }
  // Method to refresh data
  Future<void> refreshData() async {
    await loadData();
  }
}