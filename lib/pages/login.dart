import 'package:flutter/material.dart';
import 'package:main_application/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Selamat datang kembali! Senang melihatmu kembali!"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan e-mail kamu',
                  fillColor: Colors.grey,
                  
                ),
              ),
            ),
          ]
        )
      ),
    );
      
  }
}