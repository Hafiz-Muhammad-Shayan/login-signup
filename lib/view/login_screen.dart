import 'package:firebasewithflutter/controllers/authController.dart';
import 'package:firebasewithflutter/view/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  // Get.put se controller ko initialize kar rahe hain
  final Authcontroller authController = Get.put(Authcontroller());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),

            // Obx loading state ke waqt circular progress bar dikhane ke liye
            Obx(() {
              return authController.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  authController.login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: const Text("Login"),
              );
            }),

            TextButton(
              onPressed: () => Get.to(() => SignUpScreen()),
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}