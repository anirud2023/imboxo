import 'app_local_data.dart';

class AppLocalDataImpl extends AppLocalData {
  static const String _appLoginStatus = "AppLoginCode";
  static const String _appUserToken = "AppUserToken";
  static const String _appuserId ="UserId";



  @override
  bool getLoginStatus() {
    return box.read(_appLoginStatus) ?? false;
  }

  @override
  void setLoginStatus(bool set) {
    box.write(_appLoginStatus, set);
  }

  @override
  void setUserToken(String token){
    box.write(_appUserToken, token);
  }

  @override
  String getUserToken() {
    return box.read(_appUserToken);
  }

  @override
  int getUserID() {
    return box.read(_appuserId);
  }



}