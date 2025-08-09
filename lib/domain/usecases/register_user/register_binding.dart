import 'package:get/get.dart';
import 'package:untitled/data/repositories/register_user_impl.dart';
import 'package:untitled/domain/repository/register_user_repo/register_repo.dart';
import 'package:untitled/domain/usecases/register_user/register_controller.dart';

class RegisterScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterUserController>(() => RegisterUserController());
    Get.lazyPut<RegisterUserRepo>(() => RegisterUserRepoImpl());
  }

}