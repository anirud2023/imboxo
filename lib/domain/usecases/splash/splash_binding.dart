import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

import 'splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<SplashController>(() => SplashController());

  }

}