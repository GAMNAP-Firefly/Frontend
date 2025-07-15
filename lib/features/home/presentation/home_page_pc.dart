import 'package:fittest/features/home/presentation/widgets/light_bulb_icon.dart';
import 'package:fittest/features/home/presentation/widgets/test_item.dart';
import 'package:flutter/material.dart';
import '../../../resources/strings.dart';
import '../../test_description/presentation/test_description_page_pc.dart';

class HomePagePc extends StatelessWidget {
  const HomePagePc({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFECEFF4),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: screenHeight * 0.25 - 90),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 27,
                        child: Image.asset(
                          Strings.fittinImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        Strings.title,
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3D4853),
                          fontFamily: "Raleway",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Strings.instructions,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF737E8A),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway",
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),

              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TestItem(
                                    icon: 'M',
                                    title: Strings.testNameMock1,
                                    description: Strings.homePageDesc1,
                                    buttonText: Strings.startTestButton,
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFFBF616A), Color(0xFFD08770)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    onPressed: () => _navigateToTest(context),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TestItem(
                                    icon: 'M',
                                    title: Strings.testNameMock2,
                                    description: Strings.homePageDesc2,
                                    buttonText: Strings.startTestButton,
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFFD08770), Color(0xFFEBCB8B)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    onPressed: () => _navigateToTest(context),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TestItem(
                                    icon: 'E',
                                    title: Strings.testNameMock3,
                                    description: Strings.homePageDesc3,
                                    buttonText: Strings.startTestButton,
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFFEBCB8B), Color(0xFFA3BE8C)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    onPressed: () => _navigateToTest(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 400),
                              child: TestItem(
                                icon: 'R',
                                title: Strings.results,
                                description: Strings.homepageResDesc,
                                buttonText: Strings.myResultsButton,
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF8FBCBB), Color(0xFF8FBCBB)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            right: 40,
            child: LightBulbIcon(),
          ),
        ],
      ),
    );
  }

  void _navigateToTest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TestDescriptionPagePc(),
      ),
    );
  }
}