import 'api_util.dart';

class ApiUtilImpl implements ApiUtil {


  @override
  Map<String, String> loginRequestBody(String email,String password)  {
    return {
      "email": email,
      "password": password
    };

  }

  @override
  Map<String, String> registerRequestBody(
      String name,
      String phone,
      String email,
      String password,
      ) {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
    };
  }




}