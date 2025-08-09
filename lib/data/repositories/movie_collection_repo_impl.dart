import 'package:get/get.dart';
import 'package:untitled/data/datasources/remote/remote/app_url.dart';
import 'package:untitled/data/datasources/remote/remote/network_api_services.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/status.dart';
import 'package:untitled/data/model/movie_collection_model.dart';
import 'package:untitled/domain/repository/movie_collection_repo/movie_collection_repo.dart';
import 'package:untitled/utils/api_utils/api_util.dart';

class MovieCollectionRepoImpl implements MovieCollectionRepo{
  final NetworkApiServices _baseApiServices = Get.find<NetworkApiServices>();
  final ApiUtil _apiUtil = Get.find();

  @override
  Future<Resource> getMovieCollection() async {
    Resource resource = await _baseApiServices.getRequest(
      url: AppUrl.movieCollectionEndPont,
    );

    if (resource.status == STATUS.SUCCESS && resource.data != null) {
      MovieCollectionModel model = MovieCollectionModel.fromJson(resource.data);
      return Resource.success(data: model, message: resource.message);
    } else {
      return resource;
    }
  }

}