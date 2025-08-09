import 'package:get/get.dart';
import 'package:untitled/data/repositories/login_repo_impl.dart';
import 'package:untitled/domain/repository/login_repo/login_repo.dart';
import 'package:untitled/domain/usecases/login/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginRepo>(() => LoginRepoImpl());

  }

}