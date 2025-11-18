import 'package:flutter/material.dart';
import 'package:login_aplikasi/side_menu.dart';

class AboutPage extends StatelessWidget {
  final String title;
  final String description;
  final String imgPath;

  const AboutPage({
    super.key,
    required this.title,
    required this.description,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      backgroundColor: const Color(0xFFFFF4E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF800000),
        title: Text(title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imgPath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (c, o, e) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported,
                      size: 70, color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Color(0xFF800000),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
