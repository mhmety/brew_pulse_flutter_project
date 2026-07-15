class Coffee {
  final String name;
  final String price;
  final String description;
  final String imageUrl;

  Coffee({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      name: json['name'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}

final List<Coffee> mockCoffeeList = [
  Coffee(
    name: "Americano",
    price: "120 TL",
    description: "Columbia kahve çekirdeklerimizden taze çekilmiş espressodan yapılmış bu kadifemsi içecek, her yudumda farklı bir deneyim sunar.",
    imageUrl: "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?q=80&w=600&auto=format&fit=crop",
  ),
  Coffee(
    name: "Latte",
    price: "160 TL",
    description: "Özenle seçilmiş espresso çekirdeklerinin, mükemmel şekilde köpürtülmüş sıcak süt ile buluştuğu yumuşak içimli klasik lezzet.",
    // Yeni, sorunsuz yüklenen Latte görsel adresi
    imageUrl: "https://images.unsplash.com/photo-1541167760496-1628856ab772?q=80&w=600&auto=format&fit=crop",
  ),
];