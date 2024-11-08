import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/pages/register.dart';
import 'package:dharma_bakti_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:dharma_bakti_app/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/db_logo.png",
                  width: 250,
                  height: 250,
                ),
                Text(
                  "Mengubah Tantangan Menjadi Peluang", 
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey
                  )
                ),
                const SizedBox(
                  height: 100
                ),
                PrimaryButton(
                  color: AppColors.primaryColor, text: "Login", nextPage: LoginPage()
                ),
                const SizedBox(
                  height: 15
                ),
                PrimaryButton(
                  color: AppColors.secondaryColor, text: "Register", nextPage: RegisterPage()
                ),
              ],
            ),
          )
        )  
      ),
    );
    
    
    
    
  }
}