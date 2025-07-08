import 'package:flutter/material.dart';

class TestDescription extends StatelessWidget {
  final String testDesc;

  const TestDescription({super.key, required this.testDesc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
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
          child: Text(
            testDesc,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFF3D4853),
              fontFamily: "Raleway",
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
