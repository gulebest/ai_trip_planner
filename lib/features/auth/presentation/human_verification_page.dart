import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class HumanVerificationPage extends StatefulWidget {
  const HumanVerificationPage({super.key});

  @override
  State<HumanVerificationPage> createState() => _HumanVerificationPageState();
}

class _HumanVerificationPageState extends State<HumanVerificationPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Progress bar
            LinearProgressIndicator(
              value: 0.5,
              color: AppColors.primary,
              backgroundColor: AppColors.greyLight,
            ),

            const SizedBox(height: 32),

            const Text(
              "Verify you're human 🤖",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 8),

            const Text(
              "Please solve this captcha so we know you are a person.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 32),

            /// Checkbox containe
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyLight),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  const Text("I'm not a robot", style: TextStyle(fontSize: 15)),
                  const Spacer(),
                  const Icon(Icons.verified, color: Colors.blue),
                ],
              ),
            ),

            const Spacer(),

            /// Continue
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: isChecked
                    ? () => context.go('/image-captcha')
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.greyLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text('Continue', style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
