import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';

abstract class  MovieCollectionRepo{

  Future<Resource> getMovieCollection();

}