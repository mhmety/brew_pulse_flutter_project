import 'package:flutter/material.dart';
import '../models/coffee_model.dart';

class DetailScreen extends StatefulWidget {
  final Coffee coffee;

  const DetailScreen({super.key, required this.coffee});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String selectedSize = "S";
  final List<String> sizes = ["S", "M", "L"];
  bool isFavorite = false; // ❤️ Favori durumunu kontrol eden değişken

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
              
              // Üst Nav Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Sorunsuz geri dönüş
                    },
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                    ),
                  ),
                  const Text(
                    "Detay",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  
                  // ❤️ FAVORİ (KALP) BUTONU - DÜZELTİLDİ VE ETKİLEŞİMLİ YAPILDI
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite; // Her tıklamada durumu tersine çevirir
                      });
                    },
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isFavorite 
                            ? const Color(0xffC07A4A).withOpacity(0.2) // Aktifken şeffaf tarçın
                            : Colors.white.withOpacity(0.1), // Pasifken şeffaf beyaz
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border, // Aktifse dolu kalp, değilse boş kalp
                        color: isFavorite ? const Color(0xffC07A4A) : Colors.white, // Renk değişimi
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Kahve Görseli
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.coffee.imageUrl,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 260,
                      color: Colors.white.withOpacity(0.05),
                      child: const Icon(Icons.broken_image, color: Color(0xffA89070), size: 40),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Kahve Adı
              Text(
                widget.coffee.name,
                style: const TextStyle(
                  fontFamily: 'Fraunces',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF5F2EB),
                ),
              ),
              const SizedBox(height: 8),

              // Fiyat
              Text(
                widget.coffee.price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffC07A4A),
                ),
              ),
              const SizedBox(height: 16),

              // Açıklama
              Text(
                widget.coffee.description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.7,
                  color: Color(0xffA89070),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Boyut Seçimi",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 12),

              // Boyut Seçenekleri
              Row(
                children: sizes.map((size) {
                  final bool isSelected = size == selectedSize;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xffC07A4A).withOpacity(0.15) : Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? const Color(0xffC07A4A) : const Color(0xff3A2E1E),
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          size,
                          style: TextStyle(
                            color: isSelected ? const Color(0xffC07A4A) : const Color(0xffA89070),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Spacer(),

              // Sepete Ekle Butonu
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${widget.coffee.name} (${selectedSize} Boy) Sepete Eklendi!"),
                      backgroundColor: const Color(0xffC07A4A),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xffC07A4A), Color(0xffA0612E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Sepete Ekle",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}