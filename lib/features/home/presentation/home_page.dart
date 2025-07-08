import 'package:fittest/features/home/presentation/widgets/home_label.dart';
import 'package:fittest/features/home/presentation/widgets/test_item.dart';
import 'package:fittest/features/test_description/presentation/test_description_page.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:fittest/resources/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [Colors.amber, Colors.yellow],
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.lightbulb,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  HomeLabel(),
                  const SizedBox(height: 40),
                  TestItem(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestDescriptionPage(),
                        ),
                      );
                    },
                    testName: Strings.testNameMock1,
                    color: Color(0xFFA3BE8C),
                  ),
                  const SizedBox(height: 12),
                  TestItem(
                    onPressed: () {},
                    testName: Strings.testNameMock2,
                    color: Color(0xFFD08770),
                  ),
                  const SizedBox(height: 12),
                  TestItem(
                    onPressed: () {},
                    testName: Strings.testNameMock3,
                    color: Color(0xFFBF616A),
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
