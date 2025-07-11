import 'package:flutter/material.dart';

import '../../../../resources/strings.dart';

class InterpretationCard extends StatelessWidget {
  const InterpretationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InterpretationHeader(),
          const SizedBox(height: 16),
          Text(
            _getGeneralInterpretation(),
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF737E8A),
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
  const InterpretationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF8FBCBB), Color(0xFF88B2D0)],
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
        const Text(
          Strings.resInterprTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3D4853),
            fontFamily: "Raleway",
          ),
        ),
      ],
    );
  }
}