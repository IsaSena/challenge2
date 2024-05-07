import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';

class BlueContainer extends StatelessWidget {
  const BlueContainer({super.key, required this.height, this.child});

  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      color: Themes.Azul,
    ),
      height: height,
      width: double.infinity,
      child: child,
    );
  }
}
