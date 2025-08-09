import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';

abstract class AllMovieCollectionRepo{

  Future<Resource> getAllMovieCollection();
}