import 'package:fittest/features/test_processing/presentation/bloc/test_processing_bloc.dart';
import 'package:fittest/features/test_processing/presentation/widgets/answer_buttons.dart';
import 'package:fittest/features/test_processing/presentation/widgets/app_drawer.dart';
import 'package:fittest/features/test_processing/presentation/widgets/back_button.dart';
import 'package:fittest/features/test_processing/presentation/widgets/progress_bar.dart';
import 'package:fittest/features/test_processing/presentation/widgets/progress_percentage.dart';
import 'package:fittest/features/test_processing/presentation/widgets/question_block.dart';
import 'package:fittest/features/test_result/presentation/test_result_page.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/domain/model/test.dart';
import '../../test_description/presentation/test_description_page.dart';

class TestProcessingPage extends StatelessWidget {
  final Test test;

  const TestProcessingPage({
    super.key,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestProcessingBloc(
        startTest: context.read(),
        getQuestion: context.read(),
        submitAnswer: context.read(),
        completeTest: context.read(),
      )..add(LoadInitialQuestion(test.id)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<TestProcessingBloc, TestProcessingState>(
          listener: (context, state) {
            if (state is TestProcessingError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!!)),
              );
            } else if (state is TestProcessingCompleted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TestResultPage(),
                ),
              );
            }
          },
          builder: (context, state) {
            final question = state.currentQuestion;
            final isLoading = state.isLoading;

            return Scaffold(
              appBar: AppBar(
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFF737E8A),
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                title: Builder(
                  builder: (context) {
                    final appBarTheme = Theme.of(context).appBarTheme;
                    final leadingWidth = appBarTheme.leadingWidth ?? 56.0;
                    final iconWidth = 24.0;
                    final spaceBetweenIconAndProgress =
                        (leadingWidth - iconWidth) / 2;

                    return Row(
                      children: [
                        Expanded(
                          child: ProgressBar(
                            progress: question.progressPercent / 100,
                            fillColor: const Color(0xFF8FBCBB),
                            borderColor:
                            const Color(0xFF3D4853).withOpacity(0.2),
                            height: 12.0,
                            borderRadius: 6.0,
                          ),
                        ),
                        SizedBox(width: spaceBetweenIconAndProgress),
                        ProgressPercentage(
                            progress: question.progressPercent / 100),
                      ],
                    );
                  },
                ),
                backgroundColor: const Color(0xFFECEFF4),
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                      color: const Color(0xFF737E8A), height: 1.0),
                ),
              ),
              drawer: AppDrawer(
                questionCount: question.total,
                currentQuestionIndex: question.index,
                onQuestionSelected: (index) {
                  context.read<TestProcessingBloc>().add(
                    NavigateToQuestion(
                      index,
                      question.resultId,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
              body: Stack(
                children: [
                  if (isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            QuestionHeader(
                              number: question.index,
                              text: question.text,
                            ),
                            const SizedBox(height: 40),
                            AnswerButtons(
                              variants: question.variants,
                              onPressed: (variantId) {
                                context.read<TestProcessingBloc>().add(
                                  AnswerQuestion(
                                    question.id,
                                    variantId,
                                    question.resultId,
                                  ),
                                );
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
                    child: CustomBackButton(
                      onPressed: () {
                        if (question.index > 1) {
                          context.read<TestProcessingBloc>().add(
                            NavigateToQuestion(
                              question.index - 1,
                              question.resultId,
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestDescriptionPage(test: test),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

