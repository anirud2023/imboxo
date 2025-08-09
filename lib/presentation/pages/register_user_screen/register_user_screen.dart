import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/config/routes/route_names.dart';
import 'package:untitled/domain/usecases/register_user/register_controller.dart';
import 'package:untitled/presentation/common_widgets/imboxo_logo.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterUserController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 30),

                // Logo Text
                ImboxoLogo(
                  fontSize: 40,
                  borderColor: Colors.white,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 40),

                // Name Field
                buildTextField(hintText: 'Name', controller: controller.nameController),

                // Phone Field
                buildTextField(hintText: 'Phone', keyboardType: TextInputType.phone, controller: controller.phoneController),

                // Email Field
                buildTextField(hintText: 'Email ID', keyboardType: TextInputType.emailAddress, controller: controller.emailController),

                // Password Field
                buildTextField(hintText: 'Password', obscure: true, controller: controller.passwordController),

                // Confirm Password Field
                buildTextField(hintText: 'Confirm password', obscure: true, controller: controller.confirmPasswordController),

                const SizedBox(height: 30),

                // Register Button
                SizedBox(
                  width: 200,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B5CF6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {

                      controller.registerUser();
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.white60),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom reusable text field builder
  Widget buildTextField({
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: obscure,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
