import 'package:flutter/material.dart';
import 'package:fittest/resources/app_colors.dart';

class QuestionCard extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final AppColorsScheme colors;

  const QuestionCard({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [colors.red, colors.accent],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.blockBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: gradient.colors.first.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Q',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: gradient.colors.first,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Вопрос #$questionNumber',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: colors.headerText,
                  fontFamily: "Raleway",
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            questionText,
            style: TextStyle(
              fontSize: 17,
              color: colors.questionText,
              fontWeight: FontWeight.bold,
              fontFamily: "Raleway",
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}