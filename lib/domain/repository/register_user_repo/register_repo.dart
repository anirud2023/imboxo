import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';

abstract class  RegisterUserRepo{

  Future<Resource> postRegisterUser(
  String name,
  String phone,
  String email,
  String password,
      );

}