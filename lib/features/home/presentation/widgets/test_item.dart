import 'package:flutter/material.dart';

class TestItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String testName;
  final Color color;

  const TestItem({super.key, required this.onPressed, required this.testName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: Text(
            testName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
