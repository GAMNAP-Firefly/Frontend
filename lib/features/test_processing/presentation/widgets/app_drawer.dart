import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

import '../test_proccesing_page.dart';

class AppDrawer extends StatelessWidget {
  final int questionCount;
  final Color backgroundColor = const Color(0xFFECEFF4);
  final List<Color> tileColors = const [
    Color(0xFFD08770),
    Color(0xFFEBCB8B),
    Color(0xFFA3BE8C),
    Color(0xFF8FBCBB),
  ];

  const AppDrawer({
    super.key,
    this.questionCount = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AppBar(
              leading: IconButton(
                icon: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.amber, Colors.yellow],
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.lightbulb, color: Colors.white),
                ),
                onPressed: () {},
              ),
              title: Text(
                Strings.title,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF737E8A),
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF737E8A)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: questionCount,
              itemBuilder: (context, index) {
                final colorIndex = index % tileColors.length;
                final questionNumber = index + 1;

                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestProcessingPage(
                          questionNumber: questionNumber,
                          questionText: Strings.questionMock,
                          totalQuestions: questionCount,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: tileColors[colorIndex],
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '${Strings.questionNum}$questionNumber',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}