import 'package:fittest/features/home/presentation/widgets/test_item.dart';
import 'package:flutter/material.dart';
import 'package:fittest/features/test_description/presentation/test_description_page.dart';

import '../../../resources/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF4),
      body: Column(
        children: [
          Material(
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 16,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    Strings.fittinImage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                Strings.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF3D4853),
                                  fontFamily: "Raleway",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            Strings.instructions,
                            style: TextStyle(
                              fontSize: 16,
                              color: const Color(0xFF737E8A),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway",
                            ),
                          ),
                        ],
                      ),
                      IconButton(
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
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                children: [
                  // Test Item 1
                  TestItem(
                    icon: 'M',
                    title: Strings.testNameMock1,
                    description: Strings.homePageDesc1,
                    buttonText: Strings.startTestButton,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFBF616A), Color(0xFFD08770)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TestDescriptionPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Test Item 2
                  TestItem(
                    icon: 'M',
                    title: Strings.testNameMock2,
                    description: Strings.homePageDesc2,
                    buttonText: Strings.startTestButton,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFD08770), Color(0xFFEBCB8B)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TestDescriptionPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Test Item 3
                  TestItem(
                    icon: 'E',
                    title: Strings.testNameMock3,
                    description: Strings.homePageDesc3,
                    buttonText: Strings.startTestButton,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFEBCB8B), Color(0xFFA3BE8C)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TestDescriptionPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Results Item
                  TestItem(
                    icon: 'R',
                    title: Strings.results,
                    description: Strings.homepageResDesc,
                    buttonText: Strings.myResultsButton,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8FBCBB), Color(0xFF8FBCBB)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    onPressed: () {
                      // Навигация для страницы результатов
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}