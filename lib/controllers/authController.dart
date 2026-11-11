
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasewithflutter/view/home_screen.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;

  Future<void> signup(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      Get.snackbar("Success", "Account successfully ban gya he!");
      Get.offAll(() => HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      Get.snackbar("Success", "Successfully Login ho gya he!");
      Get.offAll(() => HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}

