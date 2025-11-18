import 'package:flutter/material.dart';
import 'package:login_aplikasi/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_aplikasi/about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? namauser;

  final List<Map<String, String>> musicList = [
    {
      "title": "Pop Indonesia",
      "desc": "Kumpulan lagu pop terbaru dan hits sepanjang tahun.",
      "image": "assets/images/pop_indo.jpg"
    },
    {
      "title": "Rock Legend",
      "desc": "Lagu rock klasik dengan gitar dan energi kuat.",
      "image": "assets/images/rock_legend.jpeg"
    },
    {
      "title": "Jazz Evening",
      "desc": "Suasana santai dengan musik jazz lembut.",
      "image": "assets/images/jazz_evening.jpeg"
    },
    {
      "title": "Lo-fi Chill",
      "desc": "Musik santai untuk belajar dan bekerja.",
      "image": "assets/images/Lo-fi_chill.jpeg"
    },
    {
      "title": "K-Pop Hits",
      "desc": "Lagu-lagu K-Pop trending yang penuh koreografi.",
      "image": "assets/images/K-pop_hits.jpeg"
    },
  ];

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namauser = prefs.getString('username');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6), 
      drawer: const SideMenu(),

      appBar: AppBar(
        backgroundColor: const Color(0xFF800000),
        title: const Text("Home Page"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, $namauser",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF800000),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Tema Musik",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9B1C1C),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: musicList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AboutPage(
                              title: musicList[index]["title"]!,
                              description: musicList[index]["desc"]!,
                              imgPath: musicList[index]["image"]!,
                            ),
                          ),
                        );
                      },

                      borderRadius: BorderRadius.circular(15),

                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            child: Container(
                              width: 110,
                              height: 90,
                              color: Colors.grey[300],
                              child: Image.asset(
                                musicList[index]["image"]!,
                                fit: BoxFit.cover,
                                errorBuilder: (c, o, e) =>
                                    const Icon(Icons.broken_image,
                                        size: 40, color: Colors.grey),
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    musicList[index]["title"]!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF800000),
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    musicList[index]["desc"]!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}