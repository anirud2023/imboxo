import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/config/routes/route_names.dart';
import 'package:untitled/data/datasources/local/app_local_data.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/status.dart';
import 'package:untitled/data/model/login.dart';
import 'package:untitled/domain/repository/login_repo/login_repo.dart';
import 'package:untitled/presentation/common_widgets/circular_progress.dart';
import 'package:untitled/utils/toast_util/toast_util.dart';

class LoginController extends GetxController{

  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginRepo _loginRepoProvide = Get.find();
  final AppLocalData _storage = Get.find();


   var isButtonClickEnabled = false.obs;


  void loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ToastUtil.show("Please enter both email and password.");
      return;
    }

    isButtonClickEnabled.value = false;

    try {
      // Show loading dialog
      showDialogue();

      Resource resource = await _loginRepoProvide.postLogin(email, password);

      // Close loading dialog safely
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      if (resource.status == STATUS.SUCCESS && resource.data != null) {
        LoginModel model = resource.data;

        if (model.status == 200) {

          if (model.token == null || model.token!.isEmpty) {
            ToastUtil.show("Invalid token received. Please try again.");
            return;
          }

          // Save token
          _storage.setUserToken(model.token!);
          _storage.setLoginStatus(true);
          ToastUtil.show(model.message ?? "Login successful");

          _navigateToHome();
        } else {
          ToastUtil.show(model.message ?? "Login failed");
        }
      } else {
        ToastUtil.show(resource.message ?? "Something went wrong");
      }
    } catch (e) {
      // Close loader if still open
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      ToastUtil.show("An error occurred. Please try again.");
      debugPrint("Login error: $e"); // Log for debugging
    } finally {
      isButtonClickEnabled.value = true;
    }
  }

  void showDialogue() {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }



  void _navigateToHome() {
    Get.offAllNamed(RoutesName.kHome); // Navigate to home or dashboard
  }

}