import 'package:flutter/material.dart';
import 'package:fittest/resources/app_colors.dart';

class ResultsCard extends StatelessWidget {
  final Map<String, double> scaleResults;
  final AppColorsScheme colors;
  const ResultsCard({super.key, required this.scaleResults, required this.colors});

  @override
  Widget build(BuildContext context) {
    final isDark = colors.background.value == 0xFF2E3440;
    final isRed = colors.background.value == 0xFFEFE9D9;
    final lightGreen = const Color(0xFFA3BE8C);
    final lightYellow = const Color(0xFFEBCB8B);
    final lightRed = const Color(0xFFBF616A);
    final cardColor = isDark ? const Color(0xFF737E8A) : colors.blockBackground;
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ResultsCardHeader(colors: colors),
          ...scaleResults.entries
              .map((entry) => ScaleRow(scaleName: entry.key, value: entry.value, colors: colors))
              .toList(),
        ],
      ),
    );
  }
}

class ResultsCardHeader extends StatelessWidget {
  final AppColorsScheme colors;
  const ResultsCardHeader({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.red, colors.accent, colors.yellow],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Шкала',
              style: TextStyle(
                color: colors.buttonText,
                fontWeight: FontWeight.bold,
                fontFamily: "Raleway",
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Балл',
                style: TextStyle(
                  color: colors.buttonText,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Интерпретация',
                style: TextStyle(
                  color: colors.buttonText,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScaleRow extends StatelessWidget {
  final String scaleName;
  final double value;
  final AppColorsScheme colors;

  const ScaleRow({
    super.key,
    required this.scaleName,
    required this.value,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getColorForValue(value);
    final textColor = _getTextColorForValue(value);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.blockBackground,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              scaleName,
              style: TextStyle(
                color: colors.questionText,
                fontWeight: FontWeight.bold,
                fontFamily: "Raleway",
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                decoration: BoxDecoration(
                  color: _getBoxColor(value, colors.background.value == 0xFFEFE9D9, colors.green, colors.yellow, colors.red).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _getBoxColor(value, colors.background.value == 0xFFEFE9D9, colors.green, colors.yellow, colors.red).withOpacity(0.4),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  value.toStringAsFixed(1),
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway",
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                _getScaleInterpretation(scaleName, value),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colors.questionText,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorForValue(double value) {
    if (value < 40) return colors.green; // Зеленый
    if (value < 70) return colors.yellow; // Желтый
    return colors.red; // Красный
  }

  Color _getTextColorForValue(double value) {
    final isDark = colors.background.value == 0xFF2E3440;
    final isRed = colors.background.value == 0xFFEFE9D9;
    if (value < 40) return colors.textDark; // Темно-серый для зеленого
    if (value < 70) return colors.darkGrey; // Серый для желтого
    if (isDark) return Colors.white; // В темной теме красные цифры делаем черными
    // Для красной и светлой темы — обычный красный
    return colors.red;
  }

  Color _getBoxColor(double value, bool isRed, Color lightGreen, Color lightYellow, Color lightRed) {
    if (isRed) {
      if (value < 40) return lightGreen;
      if (value < 70) return lightYellow;
      return lightRed;
    }
    if (value < 40) return colors.green;
    if (value < 70) return colors.yellow;
    return colors.red;
  }

  String _getScaleInterpretation(String scale, double value) {
    String interpretation;
    if (value < 40) {
      interpretation = 'Низкий уровень';
    } else if (value < 70) {
      interpretation = 'Средний уровень';
    } else {
      interpretation = 'Высокий уровень';
    }

    switch (scale) {
      case 'Шкала L':
        return '$interpretation. Склонность к социально желательным ответам';
      case 'Шкала F':
        return '$interpretation. Достоверность результатов';
      case 'Депрессия':
        return '$interpretation. Эмоциональное состояние';
      default:
        return '$interpretation. Характеристика по шкале';
    }
  }
}