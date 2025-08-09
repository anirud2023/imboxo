

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:untitled/data/datasources/local/app_local_data.dart';
import 'package:untitled/data/datasources/local/app_local_data_impl.dart';
import 'package:untitled/data/datasources/remote/remote/network_api_services.dart';
import 'package:untitled/data/datasources/remote/remote/network_api_services_impl.dart';
import 'package:untitled/utils/api_utils/api_util.dart';
import 'package:untitled/utils/api_utils/api_util_impl.dart';

class AppBinding extends Bindings {


  AppBinding();

  @override
  void dependencies() async {

    Get.put<NetworkApiServices>(NetworkApiServicesImpl(), permanent: true);
    Get.put<ApiUtil>(ApiUtilImpl(), permanent: true);
    Get.put<AppLocalData>(AppLocalDataImpl(),permanent: true);
  }
}
