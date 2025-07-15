import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

class AppDrawer extends StatelessWidget {
  final int questionCount;
  final Function(int) onQuestionSelected;
  final int crossAxisCount;
  final double itemSizeFactor;

  const AppDrawer({
    super.key,
    required this.questionCount,
    required this.onQuestionSelected,
    required this.crossAxisCount,
    required this.itemSizeFactor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Container(
          width: width,
          color: Colors.white, // Белый фон всего drawer
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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Логотип и название по центру
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28, // Немного увеличил высоту логотипа
                  child: Image.asset(
                    Strings.fittinImage,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  Strings.title,
                  style: const TextStyle(
                    fontSize: 28, // Увеличил размер шрифта
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D4853),
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

  Widget _buildQuestionsGrid(double availableWidth) {
    final itemSize = (availableWidth * 0.15 * itemSizeFactor);

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
          final gradients = const [
            LinearGradient(
              colors: [Color(0xFFBF616A), Color(0xFFD08770)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            LinearGradient(
              colors: [Color(0xFFD08770), Color(0xFFEBCB8B)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            LinearGradient(
              colors: [Color(0xFFEBCB8B), Color(0xFFA3BE8C)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            LinearGradient(
              colors: [Color(0xFFA3BE8C), Color(0xFF8FBCBB)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            LinearGradient(
              colors: [Color(0xFF8FBCBB), Color(0xFF88B2D0)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ];

          return SizedBox(
            width: itemSize,
            height: itemSize,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 2,
              color: Colors.white, // Белый фон для Material
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onQuestionSelected(index + 1),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: gradients[index % gradients.length],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Raleway",
                      ),
                    ),
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