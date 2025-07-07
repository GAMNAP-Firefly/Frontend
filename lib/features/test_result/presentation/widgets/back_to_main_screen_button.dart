import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

const Color backButtonColor = Color(0xFF8FBCBB);
const Color whiteColor = Colors.white;

class BackToMainScreenButton extends StatelessWidget {
  const BackToMainScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        /// TODO: переход на главный экран
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backButtonColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      child: Text(
        Strings.backToMainScreenButton,
        style: TextStyle(
          color: whiteColor,
          fontSize: 18,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}