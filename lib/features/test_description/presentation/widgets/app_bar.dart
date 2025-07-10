import 'package:flutter/material.dart';

import '../../../../resources/strings.dart';
import '../../../home/presentation/home_page.dart';

class DescriptionAppBar extends StatelessWidget {
  final AnimationController controller;

  const DescriptionAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF3D4853),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          const Spacer(),
          const Text(
            Strings.descPageTitle,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D4853),
              fontFamily: "Raleway",
            ),
          ),
          const Spacer(),
          IconButton(
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.amber, Colors.yellow],
                ).createShader(bounds);
              },
              child: const Icon(Icons.lightbulb, color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}