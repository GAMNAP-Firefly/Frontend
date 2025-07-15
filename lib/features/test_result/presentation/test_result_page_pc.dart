import 'package:fittest/features/test_result/presentation/widgets/app_bar.dart';
import 'package:fittest/features/test_result/presentation/widgets/back_to_main_screen_button.dart';
import 'package:fittest/features/test_result/presentation/widgets/interpretation_card.dart';
import 'package:fittest/features/test_result/presentation/widgets/result_card.dart';
import 'package:fittest/features/test_result/presentation/widgets/share_button.dart';
import 'package:fittest/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme_bloc.dart';
import 'package:fittest/resources/app_colors.dart';
import '../../home/presentation/widgets/light_bulb_icon.dart';

class TestResultPagePc extends StatelessWidget {
  final Map<String, double> scaleResults;

  const TestResultPagePc({
    super.key,
    required this.scaleResults,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.theme;
    final colors = AppColors.getScheme(theme);
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 1000;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: CustomAppBar(title: Strings.resPageTitle, colors: colors),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isWideScreen ? 1000 : 800,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isWideScreen)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: ResultsCard(scaleResults: scaleResults, colors: colors),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  InterpretationCard(colors: colors),
                                  const SizedBox(height: 32),
                                  ShareResultsButton(colors: colors),
                                  const SizedBox(height: 12),
                                  BackToMainScreenButton(colors: colors),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          children: [
                            ResultsCard(scaleResults: scaleResults, colors: colors),
                            const SizedBox(height: 32),
                            InterpretationCard(colors: colors),
                            const SizedBox(height: 32),
                            ShareResultsButton(colors: colors),
                            const SizedBox(height: 12),
                            BackToMainScreenButton(colors: colors),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 24,
            right: 40,
            child: LightBulbIcon(),
          ),
        ],
      ),
    );
  }
}