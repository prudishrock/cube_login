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
  // Note: Form validation handles empty fields and format checks
  // This method only handles business logic (auth errors, network failures, etc.)
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simüle edilmiş API çağrısı (gerçek uygulamada API'ye istek atılır)
      await Future.delayed(const Duration(seconds: 2));

      // Business logic validation (e.g., invalid credentials)
      // Simüle: Eğer email "test@test.com" ve password "123456" ise başarılı
      // Gerçek uygulamada bu backend'den kontrol edilir
      if (email == 'test@test.com' && password == '123456') {
        // Başarılı login
        _isAuthenticated = true;
        _userEmail = email;
        _userName = email.split('@')[0];
        _isLoading = false;
        _errorMessage = null;
        notifyListeners();
        return true;
      } else {
        // Geçersiz kullanıcı adı veya şifre (business logic error)
        _errorMessage = 'Geçersiz email veya şifre';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      // Network or server errors
      _errorMessage = 'Giriş yapılırken bir hata oluştu: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Signup method
  // Note: Form validation handles empty fields, format checks, and password matching
  // This method only handles business logic (e.g., email already exists, network failures)
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

      // Business logic validation (e.g., email already exists)
      // Simüle: Eğer email zaten kayıtlıysa hata döndür
      // Gerçek uygulamada bu backend'den kontrol edilir
      if (email == 'existing@test.com') {
        _errorMessage = 'Bu email adresi zaten kayıtlı';
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
      // Network or server errors
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
