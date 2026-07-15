# ☕ BrewPulse — Mobil Kahve Katalog Uygulaması

BrewPulse, modern bir üçüncü nesil kahve dükkanı konsepti için tasarlanmış ve Flutter SDK kullanılarak geliştirilmiş şık bir mobil katalog uygulamasıdır.

---

## 🚀 Proje Özellikleri ve Kazanımlar

* **Giriş Ekranı (Login Screen):** Şık bir logo alanı, e-posta ve şifre input hiyerarşisi ile kullanıcı akışının başlangıç noktası.
* **Ana Sayfa (Home Screen):** Dinamik günün kahvesi banner'ı (tıklandığında Americano detayına yönlendirir), etkileşimli kategori seçim pilleri ve "Popüler Ürünler" listesi.
* **Detay Sayfası (Detail Screen):** Home sayfasından gelen verilerin dinamik yüklenmesi, etkileşimli favori (kalp) butonu ve anlık görsel geri bildirim sunan S/M/L boyut seçim sistemi.
* **Tasarım Sistemi:** Figma'da kullanılan `Fraunces` ve `DM Sans` font hiyerarşisi ile `#1A1208` (Zemin) ve `#C07A4A` (Tarçın) odaklı renk paleti uygulamaya entegre edilmiştir.

---

## 🛠️ Teknik Gereksinimler ve Kullanılan Sürüm

* **Framework:** Flutter SDK
* **Programlama Dili:** Dart
* **Kullanılan Flutter Sürümü:** `3.44.6`
* **Temel Paketler:** `material.dart` (Gereksinimler doğrultusunda ekstra üçüncü parti paket kullanılmamış, saf Flutter mimarisiyle geliştirilmiştir.)

---

## ⚙️ Kurulum ve Çalıştırma Adımları

Projeyi kendi yerel ortamınızda çalıştırmak için aşağıdaki adımları sırasıyla uygulayabilirsiniz:

1. **Projeyi Klonlayın:**
```bash
   git clone (https://github.com/mhmety/brew_pulse_flutter_project.git)
   cd brew_pulse_flutter_project

```

2. **Bağımlılıkları ve Paketleri Çekin:**
```bash
flutter pub get

```


3. **Gereksiz Önbelleği Temizleyin (Opsiyonel):**
```bash
flutter clean
flutter pub get

```


4. **Projeyi Bir Emülatör veya Fiziksel Cihazda Çalıştırın:**
```bash
flutter run

```
