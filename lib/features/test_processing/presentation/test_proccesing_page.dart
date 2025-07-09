import 'package:fittest/features/test_processing/presentation/widgets/answer_buttons.dart';
import 'package:fittest/features/test_processing/presentation/widgets/app_drawer.dart';
import 'package:fittest/features/test_processing/presentation/widgets/progress_bar.dart';
import 'package:fittest/features/test_processing/presentation/widgets/progress_percentage.dart';
import 'package:fittest/features/test_processing/presentation/widgets/question_block.dart';
import 'package:fittest/features/test_processing/presentation/widgets/back_button.dart';
import 'package:fittest/features/test_result/presentation/test_result_page.dart';
import 'package:fittest/resources/strings.dart';
import 'package:flutter/material.dart' hide BackButton;

class TestProcessingPage extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final int totalQuestions;

  const TestProcessingPage({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (questionNumber - 1) / totalQuestions;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF737E8A),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Builder(
          builder: (context) {
            final appBarTheme = Theme.of(context).appBarTheme;
            final leadingWidth = appBarTheme.leadingWidth ?? 56.0;
            final iconWidth = 24.0;
            final spaceBetweenIconAndProgress = (leadingWidth - iconWidth) / 2;

            return Row(
              children: [
                Expanded(
                  child: ProgressBar(
                    progress: progress,
                    fillColor: const Color(0xFF8FBCBB),
                    borderColor: const Color(0xFF3D4853).withOpacity(0.2),
                    height: 12.0,
                    borderRadius: 6.0,
                  ),
                ),
                SizedBox(width: spaceBetweenIconAndProgress),
                ProgressPercentage(progress: progress),
              ],
            );
          },
        ),
        backgroundColor: const Color(0xFFECEFF4),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: const Color(0xFF737E8A), height: 1.0),
        ),
      ),
      drawer: AppDrawer(questionCount: totalQuestions),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuestionHeader(number: questionNumber, text: questionText),
                  const SizedBox(height: 40),
                  AnswerButtons(
                    onPressed: () {
                      if (questionNumber < totalQuestions) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestProcessingPage(
                              questionNumber: questionNumber + 1,
                              questionText: Strings.questionMock,
                              totalQuestions: totalQuestions,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestResultPage(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: BackButton(
              onPressed: () {
                if (questionNumber > 1) {
                  //Navigator.pop(context, questionNumber - 1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestProcessingPage(
                        questionNumber: questionNumber - 1,
                        questionText: Strings.questionMock,
                        totalQuestions: totalQuestions,
                      ),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
