import 'package:fittest/features/home/presentation/widgets/light_bulb_icon.dart';
import 'package:fittest/features/home/presentation/widgets/test_item.dart';
import 'package:flutter/material.dart';
import '../../../resources/strings.dart';
import '../../test_description/presentation/test_description_page_pc.dart';
import 'package:fittest/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme_bloc.dart';

class HomePagePc extends StatelessWidget {
  const HomePagePc({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.theme;
    final colors = AppColors.getScheme(theme);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colors.background,
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
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: colors.headerText,
                          fontFamily: "Raleway",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Strings.instructions,
                    style: TextStyle(
                      fontSize: 18,
                      color: colors.questionText,
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
                                    gradient: LinearGradient(
                                      colors: [colors.red, colors.accent],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    onPressed: () => _navigateToTest(context),
                                    colors: colors,
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
                                    gradient: LinearGradient(
                                      colors: [colors.accent, colors.yellow],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    onPressed: () => _navigateToTest(context),
                                    colors: colors,
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
                                    gradient: LinearGradient(
                                      colors: [colors.yellow, colors.green],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    onPressed: () => _navigateToTest(context),
                                    colors: colors,
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
                                gradient: LinearGradient(
                                  colors: [colors.primary, colors.primary],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                onPressed: () {},
                                colors: colors,
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