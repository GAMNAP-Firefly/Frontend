import 'package:fittest/features/test_processing/presentation/test_processing_page_pc.dart';
import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

import '../../../test_processing/presentation/test_proccesing_page.dart';

class StartTestButton extends StatelessWidget {
  final AnimationController controller;
  final String buttonText;

  const StartTestButton({
    super.key,
    required this.controller,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final buttonGradient = const LinearGradient(
      colors: [Color(0xFFD08770), Color(0xFFEBCB8B)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return MouseRegion(
      onEnter: (_) => controller.forward(from: 0.5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          gradient: buttonGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFBF616A).withOpacity(0.3),
              blurRadius: controller.value * 8,
              offset: Offset(0, controller.value * 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TestProcessingPagePc(
                    questionNumber: 1,
                    questionText: Strings.questionMock,
                    totalQuestions: 100,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: "Raleway",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
