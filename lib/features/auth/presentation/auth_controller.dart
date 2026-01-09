import 'package:flutter/foundation.dart';
import '../../auth/data/auth_repository.dart';

/// Controller for authentication state management
/// Uses ChangeNotifier for state updates and delegates business logic to repository
class AuthController with ChangeNotifier {
  final AuthRepository _repository;

  bool _isLoading = false;
  String? _errorMessage;
  bool _isAuthenticated = false;
  String? _userEmail;
  String? _userName;

  AuthController(this._repository);

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
      final result = await _repository.login(email, password);

      if (result.success) {
        _isAuthenticated = true;
        _userEmail = result.userEmail;
        _userName = result.userName;
        _errorMessage = null;
      } else {
        _errorMessage = result.errorMessage;
      }

      _isLoading = false;
      notifyListeners();
      return result.success;
    } catch (e) {
      _errorMessage = 'Beklenmeyen bir hata oluştu: ${e.toString()}';
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
      final result = await _repository.signup(
        fullName,
        email,
        password,
        confirmPassword,
      );

      if (result.success) {
        _isAuthenticated = true;
        _userEmail = result.userEmail;
        _userName = result.userName;
        _errorMessage = null;
      } else {
        _errorMessage = result.errorMessage;
      }

      _isLoading = false;
      notifyListeners();
      return result.success;
    } catch (e) {
      _errorMessage = 'Beklenmeyen bir hata oluştu: ${e.toString()}';
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

