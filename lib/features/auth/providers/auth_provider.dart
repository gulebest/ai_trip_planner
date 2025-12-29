import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stream of the current Firebase user.
/// Emits `null` when logged-out.
final authStateProvider = StreamProvider<User?>(
  (ref) => FirebaseAuth.instance.idTokenChanges(),
);

/// Simple bool flag you can use anywhere in the app
final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider).value;
  return authState != null;
});
