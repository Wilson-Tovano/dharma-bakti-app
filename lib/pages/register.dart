import 'package:dharma_bakti_app/auth_services.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/pages/dashboard.dart';
import 'package:dharma_bakti_app/pages/initial_succeed.dart';
import 'package:dharma_bakti_app/widgets/primary_button.dart';
import 'package:dharma_bakti_app/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dharma_bakti_app/services/firestore_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirestoreDbService firestoreDbService = FirestoreDbService();

  Future<void> _saveLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  String username = '', email = '', password = '';

  void updateFormValue() {
    setState(() {
      username = _usernameController.text;
      email = _emailController.text;
      password = _passwordController.text;
    });
  }

  void clearControllers() {
    // Dispose of the controllers when the widget is removed
    _usernameController.clear();
    _emailController.clear();
    _passwordController.clear();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 15,
            ),
          ),
        ),
      ),

      // GestureDetection wraps as main wrapper here, so that we can unshow our keyboard by clicking somewhere
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 270,
                        child: Text(
                          "Halo! Silahkan Daftar untuk Memulai.",
                          style: GoogleFonts.poppins(
                            fontSize: 23,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFieldCustom(
                    text: 'Nama Pengguna',
                    controller: _usernameController,
                    isPassword: false),
                TextFieldCustom(
                    text: 'E-mail',
                    controller: _emailController,
                    isPassword: false),
                TextFieldCustom(
                    text: 'Password',
                    controller: _passwordController,
                    isPassword: false),
                const SizedBox(height: 50),

                // Here login button do not use primaryButton widget because Firebase Authentication inside onPressed
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 50,
                    width: 1000,
                    child: ElevatedButton(
                        onPressed: () async {
                          updateFormValue();
                          print("ini controller " + _emailController.text);
                          print("ini controller juga " +
                              _passwordController.text);

                          final message = await AuthService().registration(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          if (message!.contains('Sukses')) {
                            firestoreDbService.createMhs(
                                username, email, password);
                            clearControllers();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const InitialSucceedPage(
                                            flag: 'register ')));
                          }
                          clearControllers();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shadowColor: Colors.transparent),
                        child: Text(
                          "Daftar",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
