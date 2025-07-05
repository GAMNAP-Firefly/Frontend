import 'package:fittest/features/test_processing/presentation/widgets/answer_buttons.dart';
import 'package:fittest/features/test_processing/presentation/widgets/app_drawer.dart';
import 'package:fittest/features/test_processing/presentation/widgets/progress_bar.dart';
import 'package:fittest/features/test_processing/presentation/widgets/progress_percentage.dart';
import 'package:fittest/features/test_processing/presentation/widgets/question_block.dart';
import 'package:fittest/features/test_processing/presentation/widgets/back_button.dart';
import 'package:flutter/material.dart' hide BackButton;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FITTEST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFECEFF4),
      ),
      home: const QuestionPage(),
    );
  }
}

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = 0.09;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF737E8A)),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Builder(
          builder: (context) {
            // Получаем appBarTheme из текущей темы
            final appBarTheme = Theme.of(context).appBarTheme;
            // Ширина leading-виджета (по умолчанию 56.0)
            final leadingWidth = appBarTheme.leadingWidth ?? 56.0;
            // Ширина иконки (24.0 для Icons.arrow_back)
            final iconWidth = 24.0;
            // Расстояние между иконкой и началом ProgressBar
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
                SizedBox(width: spaceBetweenIconAndProgress), // Отступ справа от ProgressBar
                ProgressPercentage(progress: progress),
              ],
            );
          },
        ),
        backgroundColor: const Color(0xFFECEFF4),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFF737E8A),
            height: 1.0,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          // Центрированный контент
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Важно для правильного центрирования
                children: [
                  const QuestionHeader(
                    number: 1,
                    text: "Вы когда-нибудь мечтали стать лучшей версией себя?",
                  ),
                  const SizedBox(height: 40),
                  AnswerButtons(
                    onTruePressed: () {},
                    onUnknownPressed: () {},
                    onFalsePressed: () {},
                  ),
                  const SizedBox(height: 80), // Отступ для кнопки "Назад"
                ],
              ),
            ),
          ),

          // Кнопка "Назад" внизу экрана
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: const BackButton(),
          ),
        ],
      ),
    );
  }
}