import 'package:get_storage/get_storage.dart';

abstract class AppLocalData {
  final box = GetStorage();


  bool getLoginStatus();

  void setLoginStatus(bool set);

  void setUserToken(String token);

  String getUserToken();

  int getUserID();

}
