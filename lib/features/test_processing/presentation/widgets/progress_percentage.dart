import 'package:flutter/material.dart';

class ProgressPercentage extends StatelessWidget {
  final double progress;

  const ProgressPercentage({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(progress * 100).round()}%',
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF737E8A),
      ),
    );
  }
}