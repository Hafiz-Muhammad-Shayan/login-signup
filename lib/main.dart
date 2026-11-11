import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasewithflutter/appServices/notificationService.dart';
import 'package:firebasewithflutter/view/home_screen.dart';
import 'package:firebasewithflutter/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  @pragma("vm:entry-point")
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.notification?.title}");
  }



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Notificationservice.initialize();

  final User? currentUser = FirebaseAuth.instance.currentUser;

  runApp(MyApp(isLoggedIn: currentUser != null,));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: isLoggedIn ? HomeScreen() : LoginScreen(),
    );
  }
}
