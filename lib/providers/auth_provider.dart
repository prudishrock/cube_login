import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool _isAuthenticated = false;
  String? _userEmail;
  String? _userName;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _isAuthenticated;
  String? get userEmail => _userEmail;
  String? get userName => _userName;

  // Login method
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simüle edilmiş API çağrısı (gerçek uygulamada API'ye istek atılır)
      await Future.delayed(const Duration(seconds: 2));

      // Basit validation (gerçek uygulamada backend'den kontrol edilir)
      if (email.isEmpty || password.isEmpty) {
        _errorMessage = 'Email ve şifre boş olamaz';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      if (!email.contains('@')) {
        _errorMessage = 'Geçerli bir email adresi giriniz';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      if (password.length < 6) {
        _errorMessage = 'Şifre en az 6 karakter olmalıdır';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      // Başarılı login (simüle)
      _isAuthenticated = true;
      _userEmail = email;
      _userName = email.split('@')[0];
      _isLoading = false;
      _errorMessage = null;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Giriş yapılırken bir hata oluştu: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Signup method
  Future<bool> signup(
    String fullName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simüle edilmiş API çağrısı
      await Future.delayed(const Duration(seconds: 2));

      // Validation
      if (fullName.isEmpty) {
        _errorMessage = 'Ad Soyad boş olamaz';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        _errorMessage = 'Tüm alanları doldurunuz';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      if (!email.contains('@')) {
        _errorMessage = 'Geçerli bir email adresi giriniz';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      if (password.length < 6) {
        _errorMessage = 'Şifre en az 6 karakter olmalıdır';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      if (password != confirmPassword) {
        _errorMessage = 'Şifreler eşleşmiyor';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      // Başarılı signup (simüle)
      _isAuthenticated = true;
      _userEmail = email;
      _userName = fullName;
      _isLoading = false;
      _errorMessage = null;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Kayıt olurken bir hata oluştu: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout method
  void logout() {
    _isAuthenticated = false;
    _userEmail = null;
    _userName = null;
    _errorMessage = null;
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
