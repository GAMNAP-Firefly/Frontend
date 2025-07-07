import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

const Color textColor = Color(0xFF3D4853);

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Strings.resTextMock,
          style: const TextStyle(
            fontSize: 30,
            color: textColor,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}