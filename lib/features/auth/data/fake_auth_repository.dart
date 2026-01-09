import 'auth_repository.dart';

/// Fake implementation of AuthRepository for demo/testing purposes
/// In production, this would be replaced with a real API repository
class FakeAuthRepository implements AuthRepository {
  @override
  Future<AuthResult> login(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    try {
      // Business logic validation (e.g., invalid credentials)
      // Simüle: Eğer email "test@test.com" ve password "123456" ise başarılı
      // Gerçek uygulamada bu backend'den kontrol edilir
      if (email == 'test@test.com' && password == '123456') {
        return AuthResult.success(
          userEmail: email,
          userName: email.split('@')[0],
        );
      } else {
        // Geçersiz kullanıcı adı veya şifre (business logic error)
        return AuthResult.failure('Geçersiz email veya şifre');
      }
    } catch (e) {
      // Network or server errors
      return AuthResult.failure('Giriş yapılırken bir hata oluştu: ${e.toString()}');
    }
  }

  @override
  Future<AuthResult> signup(
    String fullName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    try {
      // Business logic validation (e.g., email already exists)
      // Simüle: Eğer email zaten kayıtlıysa hata döndür
      // Gerçek uygulamada bu backend'den kontrol edilir
      if (email == 'existing@test.com') {
        return AuthResult.failure('Bu email adresi zaten kayıtlı');
      }

      // Başarılı signup (simüle)
      return AuthResult.success(
        userEmail: email,
        userName: fullName,
      );
    } catch (e) {
      // Network or server errors
      return AuthResult.failure('Kayıt olurken bir hata oluştu: ${e.toString()}');
    }
  }
}

