import 'package:dharma_bakti_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  Future<void> _saveLogoutStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          _saveLogoutStatus();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SplashScreenPage(),
            ),
          );
        }, 
        child: const Text("Logout")
      ),
    );
  }
}