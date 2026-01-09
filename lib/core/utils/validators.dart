/// Centralized validators for form validation
/// Follows DRY principle - single source of truth for validation logic
class Validators {
  // Email validation regex pattern
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Minimum password length
  static const int minPasswordLength = 6;

  /// Validates if a value is not empty
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Bu alan'} gereklidir';
    }
    return null;
  }

  /// Validates email format
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email adresi gereklidir';
    }
    if (!_emailRegex.hasMatch(value)) {
      return 'Geçerli bir email adresi giriniz';
    }
    return null;
  }

  /// Validates password (required + minimum length)
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre gereklidir';
    }
    if (value.length < minPasswordLength) {
      return 'Şifre en az $minPasswordLength karakter olmalıdır';
    }
    return null;
  }

  /// Validates confirm password (required + matches password)
  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Şifre onayı gereklidir';
    }
    if (value != password) {
      return 'Şifreler eşleşmiyor';
    }
    return null;
  }

  /// Validates full name (required)
  static String? fullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ad Soyad gereklidir';
    }
    return null;
  }
}

