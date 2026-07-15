import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import 'detail_screen.dart';
import 'login_screen.dart'; // 🔑 Giriş ekranına dönebilmek için import eklendi

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeCategory = "Espresso";
  final List<String> categories = ["Espresso", "Filtre", "Soğuk"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1208),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              
              // Üst Karşılama Alanı (Header)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Günaydın ☕",
                        style: TextStyle(color: Color(0xffA89070), fontSize: 13),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Kahve Sever",
                        style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF5F2EB),
                        ),
                      ),
                    ],
                  ),
                  
                  // 👤 PROFİL BUTONU - TIKLANINCA GİRİŞ EKRANINA GİDER
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (route) => false, // Geri tuşuna basınca tekrar buraya dönmesin diye tüm geçmişi temizler
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Kampanya Banner'ı
              GestureDetector(
                onTap: () {
                  if (mockCoffeeList.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(coffee: mockCoffeeList[0]),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1509042239860-f550ce710b93?q=80&w=600&auto=format&fit=crop",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [const Color(0xff1A1208).withOpacity(0.85), Colors.transparent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "GÜNÜN KAHVESİ",
                          style: TextStyle(
                            color: Color(0xffC07A4A),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "%20 İndirimli!",
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffC07A4A),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Hemen Sipariş Et >",
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Kategori Seçim Butonları
              Row(
                children: categories.map((cat) {
                  final bool isActive = cat == activeCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCategory = cat;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isActive ? const Color(0xffC07A4A).withOpacity(0.18) : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isActive ? const Color(0xffC07A4A) : const Color(0xff3A2E1E),
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: isActive ? const Color(0xffC07A4A) : const Color(0xffA89070),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              const Text(
                "Popüler Ürünler",
                style: TextStyle(
                  fontFamily: 'Fraunces',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF5F2EB),
                ),
              ),
              const SizedBox(height: 14),

              // Dinamik Listeleme
              Expanded(
                child: ListView.builder(
                  itemCount: mockCoffeeList.length,
                  itemBuilder: (context, index) {
                    final coffee = mockCoffeeList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F2EB).withOpacity(0.06),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xffE6E1D6).withOpacity(0.12)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(coffee: coffee),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      coffee.imageUrl,
                                      width: 72,
                                      height: 72,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          width: 72,
                                          height: 72,
                                          color: Colors.white.withOpacity(0.05),
                                          child: const Icon(Icons.broken_image, color: Color(0xffA89070)),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          coffee.name,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffF5F2EB),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          coffee.price,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffC07A4A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          // Sağa Yönlendirme Oku
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(coffee: coffee),
                                ),
                              );
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffC07A4A).withOpacity(0.15),
                              ),
                              child: const Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xffC07A4A),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}