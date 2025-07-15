import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';
import 'package:fittest/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme_bloc.dart';
import '../../home/presentation/widgets/light_bulb_icon.dart';

import '../../test_description/presentation/test_description_page.dart';
import '../../test_result/presentation/test_result_page.dart';
import 'widgets/app_drawer.dart';
import 'widgets/question_card.dart';
import 'widgets/answer_buttons.dart';

class TestProcessingPage extends StatefulWidget {
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
  State<TestProcessingPage> createState() => _TestProcessingPageState();
}

class _TestProcessingPageState extends State<TestProcessingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.theme;
    final colors = AppColors.getScheme(theme);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colors.background,
      appBar: _buildAppBar(colors, theme),
      drawer: AppDrawer(
        questionCount: widget.totalQuestions,
        onQuestionSelected: _navigateToQuestion,
        colors: colors,
      ),
      body: _buildBody(colors, theme),
      floatingActionButton: _buildBackButton(colors, theme),
    );
  }

  AppBar _buildAppBar(AppColorsScheme colors, AppTheme theme) {
    final progress = widget.questionNumber / widget.totalQuestions;
    return AppBar(
      backgroundColor: colors.blockBackground,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.menu_rounded,
            color: colors.darkGrey,
          ),
        ),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      title: Text(
        '${widget.questionNumber}/${widget.totalQuestions}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: colors.headerText,
          fontFamily: "Raleway",
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: LightBulbIcon(),
          onPressed: null,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: colors.progressBarSecondary,
          color: colors.progressBar,
          minHeight: 4,
        ),
      ),
    );
  }

  Widget _buildBody(AppColorsScheme colors, AppTheme theme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight * 0.18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackButton(AppColorsScheme colors, AppTheme theme) {
    return FloatingActionButton(
      onPressed: _navigateBack,
      backgroundColor: colors.blockBackground,
      elevation: 4,
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colors.darkGrey,
      ),
    );
  }



  void _navigateToNext(String answer) {
    if (widget.questionNumber < widget.totalQuestions) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TestProcessingPage(
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
          builder: (context) => TestResultPage(
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
        builder: (context) => TestProcessingPage(
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
          builder: (context) => TestProcessingPage(
            questionNumber: widget.questionNumber - 1,
            questionText: Strings.questionMock,
            totalQuestions: widget.totalQuestions,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TestDescriptionPage()),
      );
    }
  }
}