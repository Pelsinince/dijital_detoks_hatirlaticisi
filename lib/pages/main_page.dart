import 'dart:math'; // Rastgele sayı oluşturmak için ekliyoruz
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'article_page.dart';
import 'detoks_home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Günün sözleri listesi
  final List<String> _quotes = [
    "Dijital dünya, düşüncelerimizi şekillendiren bir ayna.",
    "Teknoloji, insanlık için bir araç olmalı; amaç değil.",
    "Dijital farkındalık, bilinçli bir kullanıcı olmanın ilk adımıdır.",
    "Sosyal medya, gerçek yaşamı unutmamak için bir hatırlatıcıdır.",
    "Dijital dünya, bağlantıda kalmak için bir kapı olmalıdır.",
  ];

  // Rastgele bir söz seçme
  String get _randomQuote {
    final random = Random();
    return _quotes[random.nextInt(_quotes.length)];
  }

  static List<Widget> _pages = <Widget>[
    ProfilePage(),
    ArticlePage(),
    DetoksHomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Alt sayfa içeriği
          _pages[_selectedIndex],
          // Profil ve Detoks sayfaları için Günün Sözü
          if (_selectedIndex == 0 || _selectedIndex == 2) // Sadece Profil ve Detoks sayfalarında göster
            Positioned(
              bottom: 80.0, // Ekranın altından 60.0 piksel yukarıda yerleştirildi
              left: 16.0,
              right: 16.0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // X, Y ofset
                    ),
                  ],
                ),
                child: Text(
                  _randomQuote, // Rastgele seçilen günün sözü
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Makale',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Hatırlatıcı',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
