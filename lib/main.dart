import 'package:flutter/material.dart';
import 'package:main_application/pages/initial.dart';
import 'package:main_application/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context)  {
    return const MaterialApp (
      home: InitialPage(),
      debugShowCheckedModeBanner: false,
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

