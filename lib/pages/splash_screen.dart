import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/pages/initial.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const InitialPage()),
      );
    });

    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 270,
                height: 270,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor.withOpacity(0.5),
                ),
              ),
              Image.asset(
                'assets/images/db_logo.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      )  
    );
  }
}