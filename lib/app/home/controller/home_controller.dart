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
  var mencategories = [].obs;
  var womencategories = [].obs;
  var sneakerscategories = [].obs;
  var menTopPicks = [].obs;
  var womenTopPicks = [].obs;
  var menCraftedItems = [].obs;
  var womenCraftedItems = [].obs;
  var officeEdits = [].obs;
  var menTrendingMerch = <Map<String, dynamic>>[].obs;
  var womenTrendingMerch = <Map<String, dynamic>>[].obs;
  var menCuratedForYou = <Map<String, dynamic>>[].obs;
  var womenCuratedForYou = <Map<String, dynamic>>[].obs;

  // 👇 Women Dynamic Lists
     var womenStyleComfort = <Map<String, dynamic>>[].obs;
   var womenChillGirl = <Map<String, dynamic>>[].obs;
   var womenBottomLine = <Map<String, dynamic>>[].obs;
   var womenHouseOfLinen = <Map<String, dynamic>>[].obs;
  //var womenSections = <String, List<Map<String, dynamic>>>{}.obs;
//    var womenDynamicList = <Map<String, dynamic>>[].obs;
 var isLoadinsss = true.obs;
  var isLoadings = false.obs;
  var onceBannerImage = [].obs;
  var officialCollabs = [].obs;
  var fandomHiddenGems = [].obs;
  var sneakersDen = [].obs;
  var hearItForm = [].obs;
  var whatMakeUs = [].obs;
  var supimaTees = [].obs;
  var markdowns = [].obs;
  var mostLovedDesign = [].obs;
  var shopForCategories = [].obs;
    var sneakersSecondBanners = [].obs;
  final RxList<dynamic> packItUp = <dynamic>[].obs;
  var menEarlyWinterDrops = <Map<String, dynamic>>[].obs;
  var womenEarlyWinterDrops = <Map<String, dynamic>>[].obs;
  final RxList<dynamic> craftedWithIntent = <dynamic>[].obs;
  final RxMap<String, RxList<dynamic>> sections = <String, RxList<dynamic>>{}.obs;
  var freshoutTheLab = [].obs;
  var bestInUbz = [].obs;
  var backOnPopularDemand = [].obs;
  var sneakersForHer = [].obs;
  var bestInReverb = [].obs;
  var bestInFumes = [].obs;
  var theLaceEdit = [].obs;
  var sockItUp = [].obs;
  final RxMap<String, RxList<dynamic>> sectioning = <String, RxList<dynamic>>{}.obs;
  final RxMap<String, RxList<dynamic>> choice = <String, RxList<dynamic>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading(true);

      await Future.wait([
        loadBanners(),
        loadTopPicks(),
        loadNewArrivals(),
        loadFitForAll(),
  loadWomenDynamicData("Style Meets Comfort", womenStyleComfort),
  loadWomenDynamicData("The Chill Girl Edit", womenChillGirl),
  loadWomenDynamicData("Bottom Line Denim", womenBottomLine),
  loadWomenDynamicData("House of Linen", womenHouseOfLinen),
       loadCategories(),
        loadAllSections(),
        loadCraftedItems(),
        loadOfficeEdits(),
        loadTrendingMerch(),
        loadOfficialCollabs(),
        loadFandomHiddenGems(),
        loadAllSneakersOthers(),
        loadSupimaTees(),
        loadMarkdowns(),
        loadMostLovedDesign(),
        loadAllSneakersSections(),
        //loadShopForCategories(),
      ]);
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadAllSections() async {
    try {
      packItUp.value = await ApiService.fetchPackItUp();
      menEarlyWinterDrops.value =
          await ApiService.fetchEarlyWinterDrops(category: "men");
      womenEarlyWinterDrops.value =
          await ApiService.fetchEarlyWinterDrops(category: "women");
      craftedWithIntent.value = await ApiService.fetchCraftedWithIntent();

      sections.value = {
        "pack it up": packItUp,
        "men early winter drops": menEarlyWinterDrops,
        "women early winter drops": womenEarlyWinterDrops,
        "crafted with intent": craftedWithIntent,
      };
    } catch (e) {
      print('Error loading sections: $e');
    }
  }
  Future<void> loadAllSneakersSections() async {
    try {
      sneakersForHer.value = await ApiService.fetchSneakersForHer();
      bestInUbz.value = await ApiService.fetchBestInUbz();
      bestInReverb.value = await ApiService.fetchBestInReverb();
      bestInFumes.value = await ApiService.fetchBestInFumes();
      theLaceEdit.value = await ApiService.fetchTheLaceEdit();
      sockItUp.value = await ApiService.fetchSockItUp();

      freshoutTheLab.value = await ApiService.fetchFreshOutTheLab();
backOnPopularDemand.value = await ApiService.fetchBackOnPopularDemand();



      sectioning.value = {
        "sneakers for her": sneakersForHer,
        "best in ubz": bestInUbz,
        "fresh out the lab": freshoutTheLab,
        "back on popular demand": backOnPopularDemand,
        "best in reverb": bestInReverb,
        "best in fumes": bestInFumes,
        "the lace edit": theLaceEdit,
        "sock it up": sockItUp,
      };
    } catch (e) {
      print('Error loading sections: $e');
    }
  }
  // ✅ Women Dynamic Sections Loader
 
    Future<void> loadWomenDynamicData(String title, RxList<Map<String, dynamic>> targetList) async {
    try {
      isLoading.value = true;
      targetList.value = await ApiService.fetchWomenDynamicData(title);
    } finally {
      isLoadinsss.value = false;
    }
  }


  Future<void> loadBanners() async {
    try {
      menBanners.value = await ApiService.fetchBanners(category: "men");
      womenBanners.value = await ApiService.fetchBanners(category: "women");
      sneakersBanners.value = await ApiService.fetchBanners(category: "sneakers");
      sneakersSecondBanners.value = await ApiService.fetchSneakersSecondBanner();

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
      sneakerscategories.value = await ApiService.fetchCategories(category: "sneakers");
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  Future<void> loadTopPicks() async {
    try {
      menTopPicks.value = await ApiService.fetchTopPicks(category: "men");
      womenTopPicks.value = await ApiService.fetchTopPicks(category: "women");
    } catch (e) {
      print('Error loading top picks: $e');
    }
  }

  Future<void> loadCraftedItems() async {
    try {
      menCraftedItems.value = await ApiService.fetchCraftedItems(category: "men");
      womenCraftedItems.value =
          await ApiService.fetchCraftedItems(category: "women");
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
      isLoadings.value = true;
      menTrendingMerch.value =
          await ApiService.fetchTrendingMerch(category: "men");
      womenTrendingMerch.value =
          await ApiService.fetchTrendingMerch(category: "women");
      menCuratedForYou.value =
          await ApiService.fetchCuratedForYou(category: "men");
      womenCuratedForYou.value =
          await ApiService.fetchCuratedForYou(category: "women");
    } catch (e) {
      print("Error loading trending merch: $e");
    } finally {
      isLoadings.value = false;
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


  Future<void> loadAllSneakersOthers() async {
    try {
      whatMakeUs.value = await ApiService.fetchWhatMakeUs();
      hearItForm.value = await ApiService.fetchHearItFrom(); 
      sneakersDen.value = await ApiService.fetchSneakersDen();
    
    choice.value = {
        "what make us": whatMakeUs,
        "hear it from": hearItForm,
        "sneakers den": sneakersDen,
      };
  }
     catch (e) {
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

  Future<void> loadMarkdowns() async {
    try {
      markdowns.value = await ApiService.fetchMarkdowns();
    } catch (e) {
      print('Error loading markdowns: $e');
    }
  }

  Future<void> loadShopForCategories() async {
    try {
      shopForCategories.value = await ApiService.fetchShopForCategories();
    } catch (e) {
      print('Error loading shop for categories: $e');
    }
  }
    Future<void> loadMostLovedDesign() async {
    try {
      mostLovedDesign.value = await ApiService.fetchMostLoveddesign();
    } catch (e) {
      print('Error loading most loved design: $e');
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

  Future<void> refreshData() async {
    await loadData();
  }
}
