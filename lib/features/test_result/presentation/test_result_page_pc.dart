import 'package:fittest/features/test_result/presentation/widgets/app_bar.dart';
import 'package:fittest/features/test_result/presentation/widgets/back_to_main_screen_button.dart';
import 'package:fittest/features/test_result/presentation/widgets/interpretation_card.dart';
import 'package:fittest/features/test_result/presentation/widgets/result_card.dart';
import 'package:fittest/features/test_result/presentation/widgets/share_button.dart';
import 'package:fittest/resources/strings.dart';
import 'package:flutter/material.dart';

class TestResultPagePc extends StatelessWidget {
  final Map<String, double> scaleResults;

  const TestResultPagePc({
    super.key,
    required this.scaleResults,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 1000;

    return Scaffold(
      backgroundColor: const Color(0xFFECEFF4),
      appBar: CustomAppBar(title: Strings.resPageTitle),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isWideScreen ? 1000 : 800,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Основной контент в строку для широких экранов
                if (isWideScreen)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Карточка с результатами
                        Expanded(
                          flex: 2,
                          child: ResultsCard(scaleResults: scaleResults),
                        ),
                        const SizedBox(width: 32),
                        // Карточка интерпретации
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const InterpretationCard(),
                              const SizedBox(height: 32),
                              const ShareResultsButton(),
                              const SizedBox(height: 12),
                              const BackToMainScreenButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (!isWideScreen)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        ResultsCard(scaleResults: scaleResults),
                        const SizedBox(height: 32),
                        const InterpretationCard(),
                        const SizedBox(height: 32),
                        const ShareResultsButton(),
                        const SizedBox(height: 12),
                        const BackToMainScreenButton(),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}