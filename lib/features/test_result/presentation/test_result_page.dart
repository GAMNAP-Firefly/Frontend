import 'package:fittest/features/test_result/presentation/widgets/back_to_main_screen_button.dart';
import 'package:fittest/features/test_result/presentation/widgets/res_desc.dart';
import 'package:fittest/features/test_result/presentation/widgets/result_text.dart';
import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

const Color backgroundColor = Color(0xFFECEFF4);
const Color textColor = Color(0xFF3D4853);

class TestResultPage extends StatelessWidget {
  const TestResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            /// TODO: переход на предыдущий экран
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ResultTextWidget(),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                Strings.resMockImage,
                width: 250,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 25),
            const ResultDescriptionWidget(),
            const Spacer(),
            const BackToMainScreenButton(),
          ],
        ),
      ),
    );
  }
}
