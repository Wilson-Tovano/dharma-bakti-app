import 'package:flutter/material.dart';
import 'package:main_application/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: Center(      
        child: Column(
          children:[
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Nama",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white70),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 10.0)),
            ),
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                icon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: "Kata Sandi",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white70),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 10.0)),
            ),
            TextField(
              style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                icon: const Icon(
                  Icons.lock_open,
                  color: Colors.white,
                ),
                hintText: "Konfirmasi Kata Sandi",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white70),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 10.0)),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
            }, child: Text("Masuk"))
          ]
        ),
      ),
    );
  }
}