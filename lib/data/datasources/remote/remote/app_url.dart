import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl{
  //static const _baseUrl = "https://reqres.in/";
  static final _baseUrl = dotenv.env['BASE_API'];
  static var loginEndPont = "${_baseUrl}api/login";
  static var registerEndPont = "${_baseUrl}api/signup";
  static var movieCollectionEndPont = "${_baseUrl}api/movie-collection";
  static var allMovieCollectionEndPont = "${_baseUrl}api/movie-list";
}