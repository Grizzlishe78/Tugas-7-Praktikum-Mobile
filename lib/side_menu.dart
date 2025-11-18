import 'package:flutter/material.dart';
import 'package:login_aplikasi/about_page.dart';
import 'package:login_aplikasi/home_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("User App"),
            accountEmail: const Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue.shade700),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutPage(
                    title: "Tentang Aplikasi",
                    description:
                        "Aplikasi ini menampilkan daftar tema musik dan detailnya.",
                    
                    // gambar default (kamu bisa ganti nanti)
                    imgPath: "assets/pop.jpg",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
