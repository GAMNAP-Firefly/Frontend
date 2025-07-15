import 'package:fittest/features/test_description/presentation/widgets/app_bar.dart';
import 'package:fittest/features/test_description/presentation/widgets/continue_button.dart';
import 'package:fittest/features/test_description/presentation/widgets/test_description_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme_bloc.dart';

import '../../../resources/strings.dart';
import '../../test_processing/presentation/test_proccesing_page.dart';
import 'package:fittest/resources/app_colors.dart';

class TestDescriptionPage extends StatefulWidget {
  const TestDescriptionPage({super.key});

  @override
  State<TestDescriptionPage> createState() => _TestDescriptionPageState();
}

class _TestDescriptionPageState extends State<TestDescriptionPage>
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
    final theme = context.watch<ThemeCubit>().state.theme;
    final colors = AppColors.getScheme(theme);
    return Scaffold(
      backgroundColor: colors.background,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Column(
                children: [
                  DescriptionAppBar(controller: _controller),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(24, 72, 24, 40),
                      child: Column(
                        children: [
                          TestDescriptionCard(colors: colors),
                          const SizedBox(height: 44),
                          StartTestButton(
                            controller: _controller,
                            buttonText: Strings.startF,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TestProcessingPage(
                                  questionNumber: 1,
                                  questionText: Strings.questionMock,
                                  totalQuestions: 100,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          StartTestButton(
                            controller: _controller,
                            buttonText: Strings.startM,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TestProcessingPage(
                                  questionNumber: 1,
                                  questionText: Strings.questionMock,
                                  totalQuestions: 100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
