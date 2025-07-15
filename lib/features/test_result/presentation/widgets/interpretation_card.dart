import 'package:flutter/material.dart';

import '../../../../resources/strings.dart';
import 'package:fittest/resources/app_colors.dart';

class InterpretationCard extends StatelessWidget {
  final AppColorsScheme colors;
  const InterpretationCard({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.blockBackground,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InterpretationHeader(colors: colors),
          const SizedBox(height: 16),
          Text(
            _getGeneralInterpretation(),
            style: TextStyle(
              fontSize: 14,
              color: colors.questionText,
              fontWeight: FontWeight.bold,
              fontFamily: "Raleway",
            ),
          ),
        ],
      ),
    );
  }

  String _getGeneralInterpretation() {
    return Strings.resDescMock;
  }
}

class InterpretationHeader extends StatelessWidget {
  final AppColorsScheme colors;
  const InterpretationHeader({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors.primary, colors.secondary],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.psychology_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          Strings.resInterprTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colors.headerText,
            fontFamily: "Raleway",
          ),
        ),
      ],
    );
  }
}