import 'package:fittest/features/test_result/presentation/widgets/app_bar.dart';
import 'package:fittest/features/test_result/presentation/widgets/back_to_main_screen_button.dart';
import 'package:fittest/features/test_result/presentation/widgets/interpretation_card.dart';
import 'package:fittest/features/test_result/presentation/widgets/result_card.dart';
import 'package:fittest/features/test_result/presentation/widgets/share_button.dart';
import 'package:fittest/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:fittest/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme_bloc.dart';

class TestResultPage extends StatelessWidget {
  final Map<String, double> scaleResults;

  const TestResultPage({
    super.key,
    required this.scaleResults,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.theme;
    final colors = AppColors.getScheme(theme);
    return Scaffold(
      backgroundColor: colors.background,
      appBar: CustomAppBar(title: Strings.resPageTitle, colors: colors),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ResultsCard(scaleResults: scaleResults, colors: colors),
            const SizedBox(height: 20),
            InterpretationCard(colors: colors),
            const SizedBox(height: 30),
            ShareResultsButton(colors: colors),
            const SizedBox(height: 12),
            BackToMainScreenButton(colors: colors),
          ],
        ),
      ),
    );
  }
}