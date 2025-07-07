import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

class AnswerButtons extends StatelessWidget {
  final VoidCallback onPressed;

  const AnswerButtons({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA3BE8C),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            Strings.ansRight,
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
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD08770),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            Strings.ansNotSure,
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
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFBF616A),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            Strings.ansWrong,
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