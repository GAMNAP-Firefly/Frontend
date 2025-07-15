import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';
import 'package:fittest/resources/app_colors.dart';

class AppDrawer extends StatelessWidget {
  final int questionCount;
  final Function(int) onQuestionSelected;
  final int crossAxisCount;
  final double itemSizeFactor;
  final AppColorsScheme colors;

  const AppDrawer({
    super.key,
    required this.questionCount,
    required this.onQuestionSelected,
    required this.crossAxisCount,
    required this.itemSizeFactor,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Container(
          width: width,
          color: colors.blockBackground,
          child: Column(
            children: [
              _buildHeader(context, width),
              Expanded(child: _buildQuestionsGrid(width)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, double drawerWidth) {
    return Container(
      width: drawerWidth,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        bottom: 18,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28,
                  child: Image.asset(
                    Strings.fittinImage,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  Strings.title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: colors.headerText,
                    fontFamily: "Raleway",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsGrid(double width) {
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: questionCount,
        itemBuilder: (context, index) {
          final gradient = gradients[index % gradients.length];
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => onQuestionSelected(index + 1),
            child: Container(
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
            ),
          );
        },
      ),
    );
  }
}