import 'package:dharma_bakti_app/pages/dashboard.dart';
import 'package:dharma_bakti_app/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Khusus jika pakai FirebaseAnalytics
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // @override
  // Widget build(BuildContext context)  {
  //   return const MaterialApp (
  //     // home: Dashboard(),
  //     home: SplashScreenPage(),
  //     debugShowCheckedModeBanner: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isUserLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for SharedPreferences
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasData) {
          print("data+" + snapshot.data.toString());
          // Navigate based on login status
          bool isLoggedIn = snapshot.data ?? false;
          return MaterialApp(
            home: isLoggedIn ? Dashboard() : const SplashScreenPage(),
            debugShowCheckedModeBanner: false,
          );
        } else {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
          // return const MaterialApp(
          //   home: SplashScreenPage(),
          //   debugShowCheckedModeBanner: false,
          // );
        }
      },
    );
  }
}
