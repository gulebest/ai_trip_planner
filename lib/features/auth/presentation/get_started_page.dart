import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/providers/auth_service_provider.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  void _goToHumanVerification(BuildContext context) {
    context.push('/human-verification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 36),

              /// Logo
              Image.asset(
                'assets/images/logo.png',
                height: 80,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.travel_explore,
                    size: 72,
                    color: AppColors.primary,
                  );
                },
              ),

              const SizedBox(height: 24),

              const Text(
                "Let's Get Started!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your Passport to Adventure Awaits",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 28),

              Consumer(
                builder: (context, ref, _) {
                  final auth = ref.read(authServiceProvider);
                  return SocialButton(
                    icon: Icons.g_mobiledata,
                    text: 'Continue with Google',
                    onTap: () async {
                      try {
                        final userCred = await auth.signInWithGoogle();

                        // Some platforms may complete sign-in via auth state change
                        final current = FirebaseAuth.instance.currentUser;

                        if (userCred != null || current != null) {
                          if (context.mounted) context.go('/home');
                          return;
                        }

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Google sign-in did not complete.'),
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Auth error: ${e.code} — ${e.message}',
                              ),
                            ),
                          );
                        }
                      } on PlatformException catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Platform error: ${e.code} — ${e.message}',
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Sign-in error: $e')),
                          );
                        }
                      }
                    },
                  );
                },
              ),

              const SizedBox(height: 12),

              SocialButton(
                icon: Icons.apple,
                text: 'Continue with Apple',
                onTap: () => _goToHumanVerification(context),
              ),

              const SizedBox(height: 12),

              SocialButton(
                icon: Icons.facebook,
                text: 'Continue with Facebook',
                onTap: () => _goToHumanVerification(context),
              ),

              const SizedBox(height: 12),

              SocialButton(
                icon: Icons.travel_explore,
                text: 'Continue with Twitter',
                onTap: () => _goToHumanVerification(context),
              ),

              const Spacer(),

              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Privacy Policy   •   Terms of Service",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        icon: Icon(icon, color: Colors.black),
        label: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
