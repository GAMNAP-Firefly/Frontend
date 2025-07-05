import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final Color fillColor;
  final Color borderColor;
  final double height;
  final double borderRadius;

  const ProgressBar({
    super.key,
    required this.progress,
    this.fillColor = const Color(0xFF8FBCBB),
    this.borderColor = const Color(0xFF3D4853),
    this.height = 8.0,
    this.borderRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white, // Фон трека
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.transparent,
          color: fillColor,
          minHeight: height,
        ),
      ),
    );
  }
}
