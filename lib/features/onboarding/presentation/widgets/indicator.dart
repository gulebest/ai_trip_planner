import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class Indicator extends StatelessWidget {
  final int activeIndex;

  const Indicator({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: activeIndex == index ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: activeIndex == index
                ? AppColors.primary
                : AppColors.greyLight,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
