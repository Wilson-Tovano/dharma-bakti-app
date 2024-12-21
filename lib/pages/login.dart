import 'package:dharma_bakti_app/auth_services.dart';
import 'package:dharma_bakti_app/constants/global_constants.dart';
import 'package:dharma_bakti_app/pages/initial_succeed.dart';
import 'package:dharma_bakti_app/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = '', password = '';

  Future<void> _saveLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('isLoggedIn', true);
    prefs.setBool('isLoggedIn', true); // tes gak pake await di setBool
  }

  void updateFormValue() {
    setState(() {
      email = _emailController.text;
      password = _passwordController.text;
    });
  }

  void clearControllers() {
    // Dispose of the controllers when the widget is removed
    _emailController.clear();
    _passwordController.clear();
    // super.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.4),
            ),
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
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 270,
                          child: Text(
                            "Selamat datang kembali! Senang melihatmu kembali!",
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
                      text: 'Masukkan E-Mail Kamu',
                      controller: _emailController,
                      isPassword: false),
                  TextFieldCustom(
                      text: 'Masukkan Password Kamu',
                      controller: _passwordController,
                      isPassword: true),
                  const SizedBox(height: 50),

                  // Here login button do not use primaryButton widget because Firebase Authentication inside onPressed
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 50,
                      width: 1000,
                      child: ElevatedButton(
                        onPressed: () async {
                          // print("ini controller " + _emailController.text);
                          // print("ini controller juga " + _passwordController.text);

                          final message = await AuthService().login(
                            email: _emailController.text,
                            password: _passwordController.text,
                            // email: 'q@gmail.com',
                            // password: '12345678',
                          );

                          // print(message);

                          if (message != null && message.contains('Success')) {
                            clearControllers();

                            // Navigate to the Home screen
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const InitialSucceedPage(flag: 'login'),
                              ),
                            );
                            // Save login status to SharedPreferences
                            await _saveLoginStatus();

                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text("Berhasil login"),
                            //   ),
                            // );
                          } else {
                            clearControllers();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(message ?? "Login gagal, coba lagi!"),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          "Login",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
