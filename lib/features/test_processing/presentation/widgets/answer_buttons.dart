import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget {
  final VoidCallback onTruePressed;
  final VoidCallback onUnknownPressed;
  final VoidCallback onFalsePressed;

  const AnswerButtons({
    super.key,
    required this.onTruePressed,
    required this.onUnknownPressed,
    required this.onFalsePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTruePressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA3BE8C),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            'Верно',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onUnknownPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD08770),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            'Не знаю',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onFalsePressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFBF616A),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            'Неверно',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}