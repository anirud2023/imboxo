import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/config/routes/route_names.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/status.dart';
import 'package:untitled/data/model/register_user.dart';
import 'package:untitled/domain/repository/register_user_repo/register_repo.dart';
import 'package:untitled/utils/toast_util/toast_util.dart';

class RegisterUserController extends GetxController{

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isButtonClickEnabled = true.obs;

  final RegisterUserRepo _registerRepoProvider = Get.find();

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void registerUser() async {
    try {
      final name = nameController.text.trim();
      final phone = phoneController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      if (name.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        ToastUtil.show("Please fill all fields.");
        return;
      }

      if (password != confirmPassword) {
        ToastUtil.show("Passwords do not match.");
        return;
      }

      isButtonClickEnabled.value = false;
      showDialogue();

      Resource resource = await _registerRepoProvider.postRegisterUser(
        name, phone, email, password,
      );

      Get.back(); // Close loading dialog

      if (resource.status == STATUS.SUCCESS && resource.data != null) {
        RegisterModel model = resource.data;

        if (model.status == 200) {
          ToastUtil.show(model.message ?? "Registration successful");
          await Future.delayed(const Duration(seconds: 1));
          Get.offAllNamed(RoutesName.kLogin);
        } else {
          // Handle API validation errors
          if (model.errors != null && model.errors!.isNotEmpty) {
            String errorMessages = model.errors!
                .map((e) => e.values.first.toString())
                .join("\n");
            ToastUtil.show(errorMessages);
          } else {
            ToastUtil.show(model.message ?? "Registration failed");
          }
        }
      } else {
        try {
          final Map<String, dynamic> body = jsonDecode(resource.data ?? "{}");
          if (body.containsKey("errors")) {
            String errorMessages = (body["errors"] as List)
                .map((e) => e.values.first.toString())
                .join("\n");
            ToastUtil.show(errorMessages);
          } else {
            ToastUtil.show(resource.message ?? "Something went wrong");
          }
        } catch (_) {
          ToastUtil.show(resource.message ?? "Something went wrong");
        }
      }
    } catch (e) {
      ToastUtil.show("Error: $e");
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

}