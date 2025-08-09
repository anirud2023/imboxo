import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/config/routes/route_names.dart';
import 'package:untitled/domain/usecases/login/login_controller.dart';
import 'package:untitled/presentation/common_widgets/imboxo_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    LoginController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IMBOXO Header
            ImboxoLogo(
              fontSize: 40,
              borderColor: Colors.white,
              textColor: Colors.white,
            ),

            const SizedBox(height: 48),

            // Email TextField
            TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
              controller: controller.emailController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                hintText: 'Email ID',
                hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),


            const SizedBox(height: 24),

            // Password TextField
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
              controller: controller.passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: EdgeInsets.symmetric(vertical: 16),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),


            const SizedBox(height: 16),

            // Forgot Password (centered)
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Login Button
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
                  controller.loginUser();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Register text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white70),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(RoutesName.kRegister);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Color(0xFF8B5CF6)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
