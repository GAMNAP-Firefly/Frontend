import 'package:flutter/material.dart';
import 'package:fittest/resources/app_colors.dart';

class AnswerButtons extends StatelessWidget {
  final Function(String) onAnswerSelected;
  final AppColorsScheme colors;

  const AnswerButtons({
    super.key,
    required this.onAnswerSelected,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAnswerButton(
          text: "Верно",
          gradient: LinearGradient(
            colors: [colors.green, colors.primary],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          onPressed: () => onAnswerSelected("Верно"),
        ),
        const SizedBox(height: 16),
        _buildAnswerButton(
          text: "Не знаю",
          gradient: LinearGradient(
            colors: [colors.accent, colors.yellow],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          onPressed: () => onAnswerSelected("Не знаю"),
        ),
        const SizedBox(height: 16),
        _buildAnswerButton(
          text: "Неверно",
          gradient: LinearGradient(
            colors: [colors.red, colors.accent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          onPressed: () => onAnswerSelected("Неверно"),
        ),
      ],
    );
  }

  Widget _buildAnswerButton({
    required String text,
    required Gradient gradient,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontFamily: "Raleway",
              ),
            ),
          ),
        ),
      ),
    );
  }
}