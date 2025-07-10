import 'package:flutter/material.dart';

class ResultsCard extends StatelessWidget {
  final Map<String, double> scaleResults;

  const ResultsCard({
    super.key,
    required this.scaleResults,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          const ResultsCardHeader(),
          ...scaleResults.entries
              .map((entry) => ScaleRow(scaleName: entry.key, value: entry.value))
              .toList(),
        ],
      ),
    );
  }
}

class ResultsCardHeader extends StatelessWidget {
  const ResultsCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFBF616A), Color(0xFFD08770), Color(0xFFEBCB8B)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Шкала',
              style: TextStyle(
                color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
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

  const ScaleRow({
    super.key,
    required this.scaleName,
    required this.value,
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
            color: Colors.grey.shade200,
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
              style: const TextStyle(
                color: Color(0xFF737E8A),
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
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: color.withOpacity(0.4),
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
                style: const TextStyle(
                  color: Color(0xFF737E8A),
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
    if (value < 40) return const Color(0xFFA3BE8C); // Зеленый
    if (value < 70) return const Color(0xFFEBCB8B); // Желтый
    return const Color(0xFFBF616A); // Красный
  }

  Color _getTextColorForValue(double value) {
    if (value < 40) return const Color(0xFF2E3440); // Темно-серый для зеленого
    if (value < 70) return const Color(0xFF3D4853); // Серый для желтого
    return const Color(0xFFBF616A); // Красный для красного (на белом фоне)
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