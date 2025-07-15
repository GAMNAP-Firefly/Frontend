import 'package:fittest/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

class ShareResultsButton extends StatelessWidget {
  const ShareResultsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8FBCBB), Color(0xFF88B2D0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8FBCBB).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: () {
            /// TODO: логика поделиться результатом
          },
          child: Center(
            child: Text(
              Strings.shareResults,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}