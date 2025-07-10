import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackButton({super.key, required this.onPressed});

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
            "Back",
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