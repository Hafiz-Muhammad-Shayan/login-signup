import 'package:firebasewithflutter/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  // Get.find() se pehle se initialized controller ko access kar rahe hain
  final Authcontroller authController = Get.put(Authcontroller());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
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

            Obx(() {
              return authController.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  authController.signup(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: const Text("Register"),
              );
            }),

            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}