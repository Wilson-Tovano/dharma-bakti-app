import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/pages/home.dart';
import 'package:dharma_bakti_app/pages/login.dart';
import 'package:dharma_bakti_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialSucceedPage extends StatelessWidget {
  const InitialSucceedPage({super.key, required this.flag});
  
  final String flag;

  @override
  Widget build(BuildContext context) {
    String displayText = flag == 'login' ? 'Login Berhasil!' : 'Registrasi Berhasil';
    String buttonText = flag == 'login' ? 'Masuk' : 'Kembali ke Login';
    Widget nextPage = flag == 'login' ? const HomePage() : LoginPage();

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 15,
              ),
            ),
        ),
      ),
      body: Column(
        children: [
          Text(displayText),
          const SizedBox(height: 40,),
          PrimaryButton(color: AppColors.primaryColor, text: buttonText, nextPage: nextPage)
        ],
      )
    );
      
  }
}