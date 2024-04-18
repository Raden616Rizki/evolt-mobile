import 'package:evolt/pages/home_page.dart';
// import 'package:evolt/pages/login_page.dart';
import 'package:evolt/pages/splash_screen.dart';
import 'package:evolt/pages/user_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
      // '/login': (context) => const LoginPage(),
      '/home': (context) => const HomePage(),
      '/user': (context) => const UserPage()
    },
  ));
}
