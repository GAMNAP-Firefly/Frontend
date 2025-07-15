import 'package:fittest/features/test_description/presentation/widgets/continue_button.dart';
import 'package:fittest/features/test_description/presentation/widgets/light_bulb_icon.dart';
import 'package:fittest/features/test_description/presentation/widgets/test_description_card.dart';
import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

import '../../test_processing/presentation/test_processing_page_pc.dart';

class TestDescriptionPagePc extends StatefulWidget {
  const TestDescriptionPagePc({super.key});

  @override
  State<TestDescriptionPagePc> createState() => _TestDescriptionPagePcState();
}

class _TestDescriptionPagePcState extends State<TestDescriptionPagePc>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _controller.forward();
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 0.97,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  const SizedBox(height: 12),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 40),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TestDescriptionCardWithBackButton(),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: StartTestButton(
                                    controller: _controller,
                                    buttonText: Strings.startF,
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TestProcessingPagePc(
                                              questionNumber: 1,
                                              questionText:
                                                  Strings.questionMock,
                                              totalQuestions: 100,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: StartTestButton(
                                    controller: _controller,
                                    buttonText: Strings.startM,
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const TestProcessingPagePc(
                                          questionNumber: 1,
                                          questionText:
                                          Strings.questionMock,
                                          totalQuestions: 100,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
}
