import 'package:fittest/features/test_description/presentation/test_description_page_pc.dart';
import 'package:fittest/features/test_result/presentation/test_result_page_pc.dart';
import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';
import 'package:fittest/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme_bloc.dart';

import 'widgets/app_drawer_pc.dart';
import 'widgets/question_card.dart';
import 'widgets/answer_buttons.dart';
import 'widgets/light_bulb_icon.dart';

class TestProcessingPagePc extends StatefulWidget {
  final int questionNumber;
  final String questionText;
  final int totalQuestions;

  const TestProcessingPagePc({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.totalQuestions,
  });

  @override
  State<TestProcessingPagePc> createState() => _TestProcessingPagePcState();
}

class _TestProcessingPagePcState extends State<TestProcessingPagePc> {
  bool _isDrawerOpen = true;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.theme;
    final colors = AppColors.getScheme(theme);
    final drawerWidth = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: _isDrawerOpen ? 0 : -drawerWidth,
            width: drawerWidth,
            top: 0,
            bottom: 0,
            child: AppDrawer(
              questionCount: widget.totalQuestions,
              onQuestionSelected: _navigateToQuestion,
              crossAxisCount: 6,
              itemSizeFactor: 0.5,
              colors: colors,
            ),
          ),

          AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.only(left: _isDrawerOpen ? drawerWidth : 0),
            child: Container(
              color: colors.background,
              child: Stack(
                children: [
                  Column(
                    children: [
                      // AppBar
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: colors.blockBackground,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x11000000),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: colors.background,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      _isDrawerOpen
                                          ? Icons.chevron_left
                                          : Icons.menu_rounded,
                                      color: colors.darkGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isDrawerOpen = !_isDrawerOpen;
                                      });
                                    },
                                  ),
                                ),

                                Text(
                                  '${widget.questionNumber}/${widget.totalQuestions}',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: colors.headerText,
                                    fontFamily: "Raleway",
                                  ),
                                ),

                                const LightBulbIcon(),
                              ],
                            ),
                            const SizedBox(height: 16),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: widget.questionNumber / widget.totalQuestions,
                                backgroundColor: colors.progressBarSecondary,
                                color: colors.progressBar,
                                minHeight: 6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    QuestionCard(
                                      questionNumber: widget.questionNumber,
                                      questionText: widget.questionText,
                                      colors: colors,
                                    ),
                                    const SizedBox(height: 40),
                                    AnswerButtons(
                                      onAnswerSelected: _navigateToNext,
                                      colors: colors,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Positioned(
                    right: 40,
                    bottom: 40,
                    child: FloatingActionButton(
                      onPressed: _navigateBack,
                      backgroundColor: colors.blockBackground,
                      elevation: 4,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: colors.darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _isDrawerOpen = true;
  }

  void _navigateToNext(String answer) {
    if (widget.questionNumber < widget.totalQuestions) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TestProcessingPagePc(
            questionNumber: widget.questionNumber + 1,
            questionText: Strings.questionMock,
            totalQuestions: widget.totalQuestions,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TestResultPagePc(
            scaleResults: {
              'Шкала L': 39.0,
              'Шкала F': 60.0,
              'Шкала K': 50.0,
              'Ипохондрия': 70.0,
              'Депрессия': 65.0,
              'Истерия': 55.0,
              'Психопатия': 75.0,
              'Мужественность': 40.0,
              'Паранойя': 58.0,
              'Психастения': 62.0,
              'Шизофрения': 68.0,
              'Гипомания': 52.0,
            },
          ),
        ),
      );
    }
  }

  void _navigateToQuestion(int number) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TestProcessingPagePc(
          questionNumber: number,
          questionText: Strings.questionMock,
          totalQuestions: widget.totalQuestions,
        ),
      ),
    );
  }

  void _navigateBack() {
    if (widget.questionNumber > 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TestProcessingPagePc(
            questionNumber: widget.questionNumber - 1,
            questionText: Strings.questionMock,
            totalQuestions: widget.totalQuestions,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TestDescriptionPagePc()),
      );
    }
  }
}