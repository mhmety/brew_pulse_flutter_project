import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1208), // Figma: Brand/Background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              
              // ☕ Kahve Logosu[cite: 2]
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [Color(0xffC07A4A), Color(0xff8B4E2A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(
                    Icons.coffee,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Başlık[cite: 2]
              const Text(
                "BrewPulse",
                style: TextStyle(
                  fontFamily: 'Fraunces', // Fraunces fontunu pubspec.yaml'a eklemelisin
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF5F2EB), // Text/Light[cite: 2]
                ),
              ),
              const SizedBox(height: 8),
              
              // Slogan[cite: 2]
              const Text(
                "Yeni nesil kahve deneyimi",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffA89070), // Text/Muted[cite: 2]
                ),
              ),
              const SizedBox(height: 48),

              // E-posta İnput Alanı[cite: 2]
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "E-posta adresiniz",
                  hintStyle: const TextStyle(color: Color(0xffA89070)),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.07), // %7 Opaklık[cite: 2]
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xff3A2E1E), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xffC07A4A), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Şifre İnput Alanı[cite: 2]
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "********",
                  hintStyle: const TextStyle(color: Color(0xffA89070)),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.07),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xff3A2E1E), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xffC07A4A), width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Giriş Yap Butonu (Figma Degrade CTA)[cite: 2]
              InkWell(
                onTap: () {
                  // Navigator ile Home ekranına geçiş[cite: 3]
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(
                      colors: [Color(0xffC07A4A), Color(0xffA0612E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Kayıt Ol Yazısı[cite: 2]
              RichText(
                text: const TextSpan(
                  text: "Hesabın yok mu? ",
                  style: TextStyle(color: Color(0xffA89070), fontSize: 13),
                  children: [
                    TextSpan(
                      text: "Kayıt Ol",
                      style: TextStyle(
                        color: Color(0xffC07A4A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}