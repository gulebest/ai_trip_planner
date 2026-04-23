import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/auth_service_provider.dart';
import '../../../core/services/auth_service.dart';

/// Stream of the current local app user.
/// Emits null when logged-out.
final authStateProvider = StreamProvider<AppUser?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
});

final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).value != null;
});
