/// Abstract repository interface for authentication operations
abstract class AuthRepository {
  Future<AuthResult> login(String email, String password);
  Future<AuthResult> signup(
    String fullName,
    String email,
    String password,
    String confirmPassword,
  );
}

/// Result class for authentication operations
class AuthResult {
  final bool success;
  final String? errorMessage;
  final String? userEmail;
  final String? userName;

  const AuthResult({
    required this.success,
    this.errorMessage,
    this.userEmail,
    this.userName,
  });

  factory AuthResult.success({
    required String userEmail,
    required String userName,
  }) {
    return AuthResult(
      success: true,
      userEmail: userEmail,
      userName: userName,
    );
  }

  factory AuthResult.failure(String errorMessage) {
    return AuthResult(
      success: false,
      errorMessage: errorMessage,
    );
  }
}

