# Cube Login - Flutter Authentication App

Modern, kullanıcı dostu bir authentication uygulaması. Flutter ile geliştirilmiş, dark theme ve modern UI/UX tasarımına sahip bir login/onboarding uygulaması.

## 📱 Özellikler

### 🎨 Kullanıcı Arayüzü
- **Dark Theme**: Modern, göz yormayan koyu tema tasarımı
- **Ambient Gradient Background**: Dinamik gradient arka plan efektleri
- **3 Sayfalı Onboarding**: Kullanıcıyı uygulamaya tanıtan interaktif onboarding akışı
- **Responsive Design**: Tüm ekran boyutlarına uyumlu tasarım

### 🔐 Authentication
- **Login Screen**: Email ve şifre ile giriş
- **Signup Screen**: Yeni kullanıcı kaydı (Full Name, Email, Password, Confirm Password)
- **Form Validation**: Gerçek zamanlı form doğrulama (TextFormField)
- **Password Visibility Toggle**: Şifre görünürlük kontrolü
- **Terms & Conditions**: Kullanım şartları checkbox kontrolü

### 🛣️ Routing & Navigation
- **Go Router**: Modern, type-safe routing çözümü
- **Auth-Aware Routing**: Authentication durumuna göre otomatik yönlendirme
- **Deep Linking**: URL bazlı sayfa yönlendirme desteği
- **Protected Routes**: Giriş yapılmamış kullanıcıları login sayfasına yönlendirme

### 🏗️ Mimari & State Management
- **Provider Pattern**: State management için Provider kullanımı
- **Modüler Yapı**: Temiz, sürdürülebilir kod organizasyonu
- **Separation of Concerns**: UI, business logic ve state yönetimi ayrımı

## 🛠️ Teknolojiler

- **Flutter**: `^3.6.1`
- **Provider**: `^6.1.1` - State Management
- **Go Router**: `^14.2.7` - Navigation & Routing

## 📁 Proje Yapısı

```
lib/
├── constants/
│   └── app_colors.dart          # Uygulama renk sabitleri
├── models/
│   └── onboarding_page_model.dart  # Onboarding sayfa modeli
├── providers/
│   └── auth_provider.dart      # Authentication state yönetimi
├── routes/
│   └── app_router.dart         # Go Router yapılandırması
├── screens/
│   ├── home/
│   │   └── home_screen.dart    # Ana sayfa (protected)
│   ├── login/
│   │   └── login_screen.dart   # Giriş sayfası
│   ├── onboarding/
│   │   └── onboarding_screen.dart  # Onboarding akışı
│   └── signup/
│       └── signup_screen.dart  # Kayıt sayfası
├── widgets/
│   ├── ambient_gradient_background.dart  # Gradient arka plan
│   ├── custom_text_field.dart  # Özel form input widget'ı
│   └── onboarding_page.dart    # Onboarding sayfa widget'ı
└── main.dart                   # Uygulama giriş noktası
```

## 🚀 Kurulum

### Gereksinimler
- Flutter SDK (3.6.1 veya üzeri)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator (veya fiziksel cihaz)

### Adımlar

1. **Projeyi klonlayın**
   ```bash
   git clone <repository-url>
   cd cube_login
   ```

2. **Bağımlılıkları yükleyin**
   ```bash
   flutter pub get
   ```

3. **Uygulamayı çalıştırın**
   ```bash
   flutter run
   ```

## 📖 Kullanım

### Test Kullanıcı Bilgileri

**Başarılı Login:**
- Email: `test@test.com`
- Password: `123456`

**Kayıtlı Email (Signup'ta hata verir):**
- Email: `existing@test.com`

### Akış

1. **Onboarding**: Uygulama ilk açıldığında 3 sayfalı onboarding gösterilir
2. **Login/Signup**: Kullanıcı giriş yapabilir veya yeni hesap oluşturabilir
3. **Home**: Başarılı giriş sonrası ana sayfaya yönlendirilir
4. **Logout**: Ana sayfadan çıkış yapılabilir

## 🎯 Öne Çıkan Özellikler

### 1. Form Validation
- **TextFormField** kullanımı ile gerçek zamanlı doğrulama
- Email format kontrolü (regex)
- Şifre uzunluk kontrolü (min 6 karakter)
- Şifre eşleşme kontrolü (signup)
- Boş alan kontrolü

### 2. Auth-Aware Routing
```dart
// Router otomatik olarak auth durumuna göre yönlendirme yapar:
// - Giriş yapılmamış + protected route → /login
// - Giriş yapılmış + auth route → /home
// - refreshListenable ile otomatik güncelleme
```

### 3. State Management
- **Provider** ile merkezi state yönetimi
- Loading states
- Error handling
- User state (email, name, authenticated)

### 4. Modüler Widget Yapısı
- **CustomTextField**: Yeniden kullanılabilir form input widget'ı
- **AmbientGradientBackground**: Gradient arka plan widget'ı
- **OnboardingPage**: Tekrar kullanılabilir onboarding sayfa widget'ı

## 🔒 Güvenlik Notları

- Şu anda authentication simüle edilmiştir (demo amaçlı)
- Gerçek uygulamada backend API entegrasyonu gerekir
- Şifreler şu anda plain text olarak saklanmaktadır (production'da hash'lenmelidir)

## 📝 Kod Kalitesi

- **Clean Architecture**: Modüler, sürdürülebilir kod yapısı
- **Separation of Concerns**: UI, business logic ve state ayrımı
- **DRY Principle**: Tekrar eden kodlar widget'lara taşınmış
- **Type Safety**: Dart'ın type system'i kullanılmış
- **Error Handling**: Try-catch blokları ve error mesajları

## 🎨 Tasarım Sistemi

### Renkler
- **Primary Cyan**: `#25D1F4` - Ana vurgu rengi
- **Dark Background**: `#1A1A1A` - Koyu arka plan
- **White**: Metin ve ikonlar için
- **Grey Tones**: İkincil metinler için

### Typography
- Başlıklar: Bold, 24-32px
- Alt başlıklar: Regular, 14-16px
- Body text: Regular, 14px

## 🧪 Test

```bash
# Widget testleri çalıştır
flutter test

# Coverage raporu
flutter test --coverage
```

## 📦 Build

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🔄 Gelecek Geliştirmeler

- [ ] Backend API entegrasyonu
- [ ] Biometric authentication (Face ID, Touch ID)
- [ ] Social login (Google, Apple)
- [ ] Password reset flow
- [ ] Remember me özelliği
- [ ] Unit testler
- [ ] Integration testler
- [ ] CI/CD pipeline

## 👨‍💻 Geliştirici Notları

### Önemli Dosyalar

- **`lib/routes/app_router.dart`**: Routing yapılandırması ve auth redirect logic
- **`lib/providers/auth_provider.dart`**: Authentication state yönetimi
- **`lib/widgets/custom_text_field.dart`**: Form validation logic
- **`lib/constants/app_colors.dart`**: Merkezi renk yönetimi

### Best Practices

1. **State Management**: Provider pattern kullanılarak merkezi state yönetimi
2. **Routing**: Go Router ile type-safe navigation
3. **Form Validation**: TextFormField validators ile client-side validation
4. **Error Handling**: User-friendly error mesajları
5. **Code Organization**: Feature-based klasör yapısı

## 📄 Lisans

Bu proje demo/portfolio amaçlı geliştirilmiştir.

## 🤝 Katkıda Bulunma

Bu bir portfolio projesidir. Sorularınız veya önerileriniz için issue açabilirsiniz.

---

**Not**: Bu uygulama interview ve portfolio amaçlı geliştirilmiştir. Production kullanımı için backend entegrasyonu ve güvenlik iyileştirmeleri gereklidir.
