import 'package:fittest/features/test_description/presentation/widgets/continue_button.dart';
import 'package:fittest/features/test_description/presentation/widgets/test_description.dart';
import 'package:fittest/features/test_processing/presentation/test_proccesing_page.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:fittest/resources/strings.dart';

class TestDescriptionPage extends StatelessWidget {
  const TestDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
              child: Text(
                Strings.testNameMock1,
                style: TextStyle(fontSize: 25, color: Color(0xFF737E8A)),
              ),
            ),
            const SizedBox(height: 40),
            TestDescription(testDesc: Strings.testDescMock),
            const SizedBox(height: 15),
            Text(
              Strings.testAuthorMock,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF3D4853),
                fontFamily: "Raleway",
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ContinueButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestProcessingPage(
                      questionNumber: 1,
                      questionText: Strings.questionMock,
                      totalQuestions: 100,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
