import 'package:fittest/features/test_description/presentation/test_description_page_pc.dart';
import 'package:fittest/features/test_result/presentation/test_result_page_pc.dart';
import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

import '../../test_result/presentation/test_result_page.dart';
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
    final drawerWidth = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      backgroundColor: const Color(0xFFECEFF4),
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
            ),
          ),

          // Основной контент
          AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.only(left: _isDrawerOpen ? drawerWidth : 0),
            child: Container(
              color: const Color(0xFFECEFF4),
              child: Stack(
                children: [
                  Column(
                    children: [
                      // AppBar
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
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
                                // Кнопка меню
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFECEFF4),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      _isDrawerOpen
                                          ? Icons.chevron_left
                                          : Icons.menu_rounded,
                                      color: const Color(0xFF3D4853),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isDrawerOpen = !_isDrawerOpen;
                                      });
                                    },
                                  ),
                                ),

                                // Номер вопроса
                                Text(
                                  '${widget.questionNumber}/${widget.totalQuestions}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3D4853),
                                    fontFamily: "Raleway",
                                  ),
                                ),

                                // Иконка лампочки
                                const LightBulbIcon(),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Прогресс-бар
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: widget.questionNumber / widget.totalQuestions,
                                backgroundColor: const Color(0xFFD8DEE9),
                                color: const Color(0xFF8FBCBB),
                                minHeight: 6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Основной контент
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
                                    ),
                                    const SizedBox(height: 40),
                                    AnswerButtons(
                                      onAnswerSelected: _navigateToNext,
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

                  // Кнопка "Назад"
                  Positioned(
                    right: 40,
                    bottom: 40,
                    child: FloatingActionButton(
                      onPressed: _navigateBack,
                      backgroundColor: Colors.white,
                      elevation: 4,
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF3D4853),
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
    // Drawer изначально открыт
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