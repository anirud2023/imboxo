import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart' show GetxController;
import 'package:untitled/config/routes/route_names.dart';
import 'package:untitled/data/datasources/local/app_local_data.dart';

class SplashController extends GetxController {

  final AppLocalData _storage = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     checkAuthenticationStatus();

  }

   void checkAuthenticationStatus() async {
     bool isLoggedIn = _storage.getLoginStatus();

     if(isLoggedIn){
       await Future.delayed(const Duration(seconds: 3)); // Splash duration
       Get.offAllNamed(RoutesName.kHome);
     }else {
       await Future.delayed(const Duration(seconds: 3)); // Splash duration
       Get.toNamed(RoutesName.kLogin);
     }
  }
}