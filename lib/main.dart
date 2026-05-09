import 'package:flutter/material.dart';
void main() {
  runApp(const KodBilgiApp());
}
class KodBilgiApp extends StatelessWidget {
  const KodBilgiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kod Bilgi Yarışması',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  final Map<String, List<Map<String, dynamic>>> quizVerisi = const {
    'Android Temel': [
      {
        'soru': 'Transform widget ne işe yarar?',
        'cevap': 'Şekil değiştirme',
        'siklar': ['Veri saklama', 'Şekil değiştirme', 'Ses çalma'],
      },
    ],
    'Dart Programlama': [
      {
        'soru': 'final ne anlama gelir?',
        'cevap': 'Değeri değişmez',
        'siklar': ['Değişir', 'Değişmez', 'Döngü'],
      }
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Kod Yarışması: Kategori Seç'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Dersini Seç ve Yarışmaya Başla!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            for (var entry in quizVerisi.entries)
              Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 3,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.code, color: Colors.white),
                  ),
                  title: Text(entry.key),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OyunSayfasi(
                          dersAdi: entry.key,
                          sorular: entry.value,
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

class OyunSayfasi extends StatelessWidget {
  final String dersAdi;
  final List<Map<String, dynamic>> sorular;

  const OyunSayfasi({super.key, required this.dersAdi, required this.sorular});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(title: Text(dersAdi), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: -0.1,
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: const SizedBox(width: 280, height: 180),
                  ),
                ),
                PhysicalModel(
                  color: Colors.white,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 300,
                    height: 200,
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        sorular[0]['soru'].toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            for (var sik in (sorular[0]['siklar'] as List))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(sik.toString()),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}