
import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';

abstract class LoginRepo {
  Future<Resource> postLogin(String email,String password) ;

}