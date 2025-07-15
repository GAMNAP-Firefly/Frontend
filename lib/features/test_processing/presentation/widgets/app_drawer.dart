import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';
import 'package:fittest/resources/app_colors.dart';

class AppDrawer extends StatelessWidget {
  final int questionCount;
  final Function(int) onQuestionSelected;
  final AppColorsScheme colors;

  const AppDrawer({
    super.key,
    required this.questionCount,
    required this.onQuestionSelected,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colors.background,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(child: _buildQuestionsGrid()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        bottom: 16,
        left: 24,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: colors.blockBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        'Вопросы',
        style: TextStyle(
          color: colors.headerText,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildQuestionsGrid() {
    final gradients = [
      LinearGradient(colors: [colors.red, colors.accent], begin: Alignment.centerLeft, end: Alignment.centerRight),
      LinearGradient(colors: [colors.accent, colors.yellow], begin: Alignment.centerLeft, end: Alignment.centerRight),
      LinearGradient(colors: [colors.yellow, colors.green], begin: Alignment.centerLeft, end: Alignment.centerRight),
      LinearGradient(colors: [colors.green, colors.primary], begin: Alignment.centerLeft, end: Alignment.centerRight),
      LinearGradient(colors: [colors.primary, colors.secondary], begin: Alignment.centerLeft, end: Alignment.centerRight),
    ];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: questionCount,
        itemBuilder: (context, index) {
          final gradient = gradients[index % gradients.length];
          return Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: colors.buttonText,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}