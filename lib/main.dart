import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/presentation/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCCOtaXGaulJjhToKpIh9iwzTPj6LxZhhw",
    appId: "1:1068678599568:android:ec28b7017f926fb6861915",
    messagingSenderId: "1068678599568",
    projectId: "compact-app-6cc6a",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // home: HomeScreen());
        home: LoginScreen());
    // home: MyContactScreen());
  }
}
