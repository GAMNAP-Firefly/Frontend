import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

import '../test_proccesing_page.dart';

class BackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8FBCBB),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back, color: Colors.white),
          SizedBox(width: 4),
          Text(
            Strings.backButton,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
