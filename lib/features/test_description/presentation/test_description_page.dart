import 'package:fittest/features/test_description/presentation/widgets/app_bar.dart';
import 'package:fittest/features/test_description/presentation/widgets/continue_button.dart';
import 'package:fittest/features/test_description/presentation/widgets/test_description_card.dart';
import 'package:flutter/material.dart';

import '../../home/domain/model/test.dart';

class TestDescriptionPage extends StatefulWidget {
  final Test test;
  const TestDescriptionPage({super.key,
    required this.test,});

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
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF4),
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
                      padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
                      child: Column(
                        children: [
                          const TestDescriptionCard(),
                          const SizedBox(height: 40),
                          StartTestButton(controller: _controller, test: widget.test),
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
