import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

const Color textColor = Color(0xFF3D4853);
const Color whiteColor = Colors.white;

class ResultDescriptionWidget extends StatelessWidget {
  const ResultDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        Strings.resDescMock,
        style: TextStyle(
          fontSize: 18,
          color: textColor,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}