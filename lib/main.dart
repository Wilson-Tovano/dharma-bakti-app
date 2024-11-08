import 'package:dharma_bakti_app/pages/home.dart';
import 'package:dharma_bakti_app/pages/login.dart';
import 'package:dharma_bakti_app/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Widget build(BuildContext context)  {
    return FutureBuilder<bool>(
      future: _isUserLoggedIn(),
      builder: (context, snapshot){
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
            home: isLoggedIn ? const HomePage() : const SplashScreenPage(),
            debugShowCheckedModeBanner: false,
          );
        } else {
          return const MaterialApp(
            home: SplashScreenPage(),
            debugShowCheckedModeBanner: false,
          );
        }
      }
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppSideMenu(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), //Kalau mau ganti Icon SideMenu, bikin leading: IconButton(), di AppBar-lah yang ditentukan Icon dan warna secara default
        title: const Text(
          "Dharma Bakti App",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.brown,

      ),
      body: Center(child: Column(
        children: [
          Text("Selamat datang di aplikasi DB_Mobile"),
          Text("Selamat datang di aplikasi DB_Mobile"),
        ],
      ),),
    );
  }
}

class AppSideMenu extends StatelessWidget {
  const AppSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Wilson Tovano"), 
            accountEmail: Text("wilsontovanoa5@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://plus.unsplash.com/premium_photo-1671656349218-5218444643d8?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/The_Forbidden_City_-_View_from_Coal_Hill.jpg/1280px-The_Forbidden_City_-_View_from_Coal_Hill.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Bagikan"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil Saya"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Pengaturan"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Keluar"),
            onTap: (){

            },
          ),
          Center(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtv--lXzB9Vyxw-DlBRLY7QXXJ0QZ_5QZcRw&s", width: 90,))
        ],
      )
    );
  }
}

