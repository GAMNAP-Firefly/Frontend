import 'package:fittest/features/home/presentation/home_page_pc.dart';
import 'package:flutter/material.dart';

import '../../../../resources/strings.dart';

class TestDescriptionCard extends StatelessWidget {
  const TestDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final titleGradient = const LinearGradient(
      colors: [Color(0xFFBF616A), Color(0xFFD08770)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Container(
      width: double.infinity,
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            decoration: BoxDecoration(
              gradient: titleGradient,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              Strings.testNameMock1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontFamily: "Raleway",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.testDescMock,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF737E8A),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway",
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  Strings.authors,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3D4853),
                    fontFamily: "Raleway",
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  Strings.testAuthorMock,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF737E8A),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestDescriptionCardWithBackButton extends StatelessWidget {
  const TestDescriptionCardWithBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const TestDescriptionCard(),
        Positioned(
          left: 16,
          top: 20,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePagePc()),
              );
            },
          ),
        ),
      ],
    );
  }
}
