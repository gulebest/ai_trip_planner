import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/theme/app_colors.dart';

class ImageCaptchaPage extends StatefulWidget {
  const ImageCaptchaPage({super.key});

  @override
  State<ImageCaptchaPage> createState() => _ImageCaptchaPageState();
}

class _ImageCaptchaPageState extends State<ImageCaptchaPage> {
  // track selection for 9 tiles
  final List<bool> _selected = List<bool>.filled(9, false);
  bool _loading = false;

  void _toggle(int index) {
    setState(() {
      _selected[index] = !_selected[index];
    });
  }

  Future<void> _verify() async {
    final selectedCount = _selected.where((s) => s).length;
    if (selectedCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one image')),
      );
      return;
    }

    setState(() => _loading = true);

    final localUri = Uri.parse('http://localhost:5000/verifyCaptcha');
    final cloudUri = Uri.parse(
      'https://us-central1-your-project.cloudfunctions.net/verifyCaptcha',
    );

    try {
      final res = await http
          .post(
            localUri,
            body: json.encode({'token': 'dev-pass'}),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 4));
      if (res.statusCode == 200) {
        final body = json.decode(res.body) as Map<String, dynamic>;
        if (body['success'] == true) {
          if (mounted) context.go('/login');
          return;
        }
      }

      final res2 = await http
          .post(
            cloudUri,
            body: json.encode({'token': 'dev-pass'}),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 6));
      if (res2.statusCode == 200) {
        final body = json.decode(res2.body) as Map<String, dynamic>;
        if (body['success'] == true) {
          if (mounted) context.go('/login');
          return;
        }
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Verification failed')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Verification error — make sure the verifier is running',
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/human-verification'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Progress
            LinearProgressIndicator(
              value: 1,
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
              "Select all images with a bicycle.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            /// Mock captcha grid
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (_, index) {
                  final selected = _selected[index];
                  return GestureDetector(
                    onTap: () => _toggle(index),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.primary
                                : AppColors.greyLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.directions_bike,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        if (selected)
                          const Positioned(
                            top: 6,
                            right: 6,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white70,
                              child: Icon(
                                Icons.check,
                                size: 16,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            /// Verify
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _loading ? null : _verify,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Verify', style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
