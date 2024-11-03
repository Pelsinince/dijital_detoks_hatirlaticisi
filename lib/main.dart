import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';

void main() => runApp(DijitalDetoksApp());

class DijitalDetoksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dijital Detoks Hatırlatıcısı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Uygulama açıldığında ilk gösterilecek sayfa
      routes: {
        '/login': (context) => LoginPage(), // Giriş sayfası
        '/signup': (context) => SignupPage(), // Kayıt sayfası
        '/main': (context) => MainPage(), // Ana sayfa
      },
    );
  }
}
