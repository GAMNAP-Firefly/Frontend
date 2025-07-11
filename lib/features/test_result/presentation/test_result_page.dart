import 'package:fittest/features/test_result/presentation/widgets/app_bar.dart';
import 'package:fittest/features/test_result/presentation/widgets/back_to_main_screen_button.dart';
import 'package:fittest/features/test_result/presentation/widgets/interpretation_card.dart';
import 'package:fittest/features/test_result/presentation/widgets/result_card.dart';
import 'package:fittest/resources/strings.dart';
import 'package:flutter/material.dart';

class TestResultPage extends StatelessWidget {
  final Map<String, double> scaleResults;

  const TestResultPage({
    super.key,
    required this.scaleResults,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF4),
      appBar: CustomAppBar(title: Strings.resPageTitle),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ResultsCard(scaleResults: scaleResults),
            const SizedBox(height: 20),
            const InterpretationCard(),
            const SizedBox(height: 30),
            const BackToMainScreenButton(),
          ],
        ),
      ),
    );
  }
}