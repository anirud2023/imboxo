import 'package:get/get.dart';
import 'package:untitled/data/repositories/movie_collection_repo_impl.dart';
import 'package:untitled/domain/repository/movie_collection_repo/movie_collection_repo.dart';
import 'package:untitled/domain/usecases/collection/collection_controller.dart';
import 'package:untitled/domain/usecases/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MovieCollectionRepo>(() => MovieCollectionRepoImpl());

  }

}