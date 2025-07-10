import 'package:flutter/material.dart';
import 'package:fittest/features/test_processing/domain/model/variant.dart';

class AnswerButtons extends StatelessWidget {
  final List<Variant> variants;
  final Function(int) onPressed;

  const AnswerButtons({
    super.key,
    required this.variants,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: variants.map((variant) {
        Color buttonColor;
        switch (variant.id % 3) {
          case 0:
            buttonColor = const Color(0xFFA3BE8C);
            break;
          case 1:
            buttonColor = const Color(0xFFD08770);
            break;
          case 2:
            buttonColor = const Color(0xFFBF616A);
            break;
          default:
            buttonColor = const Color(0xFF8FBCBB);
        }

        return Column(
          children: [
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => onPressed(variant.id),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: Text(
                variant.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}