import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const BrewPulseApp());
}

class BrewPulseApp extends StatelessWidget {
  const BrewPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrewPulse',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xffC07A4A),
        fontFamily: 'DM Sans', // Varsayılan tipografi[cite: 2]
      ),
      home: const LoginScreen(), // Uygulama Giriş Ekranı ile başlar[cite: 3]
    );
  }
}