import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final int questionNumber;
  final String questionText;

  const QuestionCard({
    super.key,
    required this.questionNumber,
    required this.questionText,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFFBF616A), Color(0xFFD08770)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D4853),
                  fontFamily: "Raleway",
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            questionText,
            style: const TextStyle(
              fontSize: 17,
              color: Color(0xFF737E8A),
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