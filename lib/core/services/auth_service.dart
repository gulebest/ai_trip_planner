import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AppUser {
  final String email;

  const AppUser({required this.email});
}

class AuthException implements Exception {
  final String message;

  const AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  static const String _sessionEmailKey = 'session_user_email';

  final StreamController<AppUser?> _authStateController =
      StreamController<AppUser?>.broadcast();
  AppUser? _currentUser;

  AuthService() {
    _restoreSession();
  }

  Stream<AppUser?> get authStateChanges => _authStateController.stream;

  AppUser? get currentUser => _currentUser;

  Future<void> _restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_sessionEmailKey);
    if (savedEmail == null || savedEmail.isEmpty) {
      _currentUser = null;
    } else {
      _currentUser = AppUser(email: savedEmail);
    }
    _authStateController.add(_currentUser);
  }

  Future<AppUser> signInWithEmail(String email, String password) async {
    final normalizedEmail = email.trim();
    final normalizedPassword = password.trim();

    if (normalizedEmail.isEmpty || !normalizedEmail.contains('@')) {
      throw const AuthException('Please enter a valid email address.');
    }
    if (normalizedPassword.length < 6) {
      throw const AuthException('Password must be at least 6 characters.');
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sessionEmailKey, normalizedEmail);

    _currentUser = AppUser(email: normalizedEmail);
    _authStateController.add(_currentUser);
    return _currentUser!;
  }

  Future<AppUser> registerWithEmail(String email, String password) async {
    // Register follows local session auth rules in this build.
    return signInWithEmail(email, password);
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionEmailKey);
    _currentUser = null;
    _authStateController.add(null);
  }

  void dispose() {
    _authStateController.close();
  }
}
