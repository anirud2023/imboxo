import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/status.dart';
import 'package:untitled/data/model/all_movie_collection.dart';
import 'package:untitled/data/model/movie_collection_model.dart';
import 'package:untitled/domain/repository/all_movie_collection_repo/all_movie_collection.dart';
import 'package:untitled/domain/repository/movie_collection_repo/movie_collection_repo.dart';
import 'package:untitled/presentation/pages/collection_screen/collection_screen.dart';
import 'package:untitled/presentation/pages/home_screen/home_page.dart';
import 'package:untitled/presentation/pages/my_space_page/my_space_screen.dart';
import 'package:untitled/presentation/pages/search_screen/search_screen.dart';
import 'package:untitled/utils/toast_util/toast_util.dart';

class HomeController extends GetxController{

  final MovieCollectionRepo _collectionRepo = Get.find();

  // Data
  final thumbnails = <String>[].obs;
  final posters = <String>[].obs;
  final languages = <String>[].obs;
  var filteredMovies = <Map<String, dynamic>>[].obs;

  // All movies data for filtering
  final allMovies = <Map<String, dynamic>>[];
  late final List<Widget> pages;

  // Selected language
  var selectedLanguage = ''.obs;




  var selectedIndex = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCollections();
    pages = [
      HomePage(controller: this,),       // Your home page widget
      CollectionsPage(controller: this,), // Your collections page widget
      SearchScreen(),     // Your search page widget
      MySpaceScreen(),    // Your profile/my space widget
    ];

  }

  Future<void> fetchCollections() async {
    try {
      isLoading.value = true;

      Resource resource = await _collectionRepo.getMovieCollection();

      if (resource.status == STATUS.SUCCESS && resource.data != null) {
        final MovieCollectionModel model = resource.data as MovieCollectionModel;

        if (model.status == 200 && model.data != null) {
          thumbnails.clear();
          posters.clear();
          languages.clear();
          allMovies.clear();

          final payload = model.data!;

          void _extractItem(dynamic item) {
            if (item == null) return;

            String? thumb;
            String? poster;
            List<dynamic>? langs;

            if (item is BannerMovie) {
              thumb = item.thumbnail;
              poster = item.poster;
              langs = item.language;
            } else if (item is Map<String, dynamic>) {
              thumb = item['thumbnail'] as String?;
              poster = item['poster'] as String?;
              langs = item['language'] as List<dynamic>?;
            } else {
              try { thumb = (item as dynamic).thumbnail as String?; } catch (_) {}
              try { poster = (item as dynamic).poster as String?; } catch (_) {}
              try { langs = (item as dynamic).language as List<dynamic>?; } catch (_) {}
            }

            if (thumb?.isNotEmpty == true || poster?.isNotEmpty == true) {
              allMovies.add({
                'thumbnail': thumb,
                'poster': poster,
                'languages': langs?.map((l) {
                  if (l is Map<String, dynamic>) return l['name'] as String?;
                  try { return (l as dynamic).name as String?; } catch (_) {}
                  return null;
                }).where((name) => name?.isNotEmpty == true).cast<String>().toList() ?? []
              });
            }

            if (langs != null) {
              for (var l in langs) {
                String? name;
                if (l is Map<String, dynamic>) {
                  name = l['name'] as String?;
                } else {
                  try { name = (l as dynamic).name as String?; } catch (_) {}
                }
                if (name?.isNotEmpty == true) languages.add(name!);
              }
            }
          }

          for (var it in payload.latestReleases) _extractItem(it);
          for (var it in payload.featuredMovies) _extractItem(it);
          for (var it in payload.topPickWeek) _extractItem(it);
          for (var it in payload.recommendationMovies) _extractItem(it);
          for (var it in payload.payPerView) _extractItem(it);
          for (var it in payload.buy) _extractItem(it);
          if (payload.trendingNow != null) {
            for (var it in payload.trendingNow) _extractItem(it);
          }
          if (payload.bannerMovie != null) _extractItem(payload.bannerMovie);

          // Deduplicate languages and add "All" at start
          final uniqueLangs = languages.toSet().toList();
          uniqueLangs.sort();
          languages.assignAll(['All', ...uniqueLangs]);

          // Default selected language = "All"
          selectedLanguage.value = 'All';

          // Show all movies initially
          filteredMovies.assignAll(allMovies);

          // Posters for all movies (optional, if you still use posters)
          posters.assignAll(allMovies.map((m) => m['poster'] as String).where((p) => p != null).cast<String>());

          debugPrint("Languages: ${languages.join(', ')}");
        } else {
          ToastUtil.show(model.message ?? "Failed to fetch collections");
        }
      } else {
        ToastUtil.show(resource.message ?? "Something went wrong");
      }
    } catch (e) {
      ToastUtil.show("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void changeTab(int index) {
  selectedIndex.value = index;
  }

  void selectLanguage(String lang) {
    debugPrint(lang);
    selectedLanguage.value = lang;
    filterByLanguage();
  }

  void filterByLanguage() {
    if (selectedLanguage.value == 'All' || selectedLanguage.value.isEmpty) {
      filteredMovies.assignAll(allMovies);
    } else {
      filteredMovies.assignAll(
          allMovies.where((movie) =>
              (movie['languages'] as List<dynamic>).contains(selectedLanguage.value)
          )
      );
    }
  }




}