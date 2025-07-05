import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle back button press
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8FBCBB),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          SizedBox(width: 4),
          Text(
            'Назад',
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