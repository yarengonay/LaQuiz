import 'package:flutter/material.dart';
void main() {
  runApp(const QuizApp()); 
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // İlk açılacak sayfa
      home: const KategoriSayfasi(),
    );
  }
}

// KATEGORİ SEÇİM EKRANI
class KategoriSayfasi extends StatelessWidget {
  const KategoriSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kod Yarışması'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Oyun sayfasına gitmek için Navigator (Uygulama 3 PDF'inden)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SoruSayfasi()),
            );
          },
          child: const Text('Android Yarışmasına Başla'),
        ),
      ),
    );
  }
}

// OYUN EKRANI (Senin istediğin o kartlı alan)
class SoruSayfasi extends StatelessWidget {
  const SoruSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Soru Ekranı')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TRANSFORM VE PHYSICALMODEL (Hocanın PDF'indeki en artistik kısım)
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
                    alignment: Alignment.center,
                    child: const Text(
                      "Transform ne işe yarar?",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const Text("Şekil Değiştirme")),
          ],
        ),
      ),
    );
  }
}