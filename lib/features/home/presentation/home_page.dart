import 'package:fittest/features/home/presentation/widgets/test_item.dart';
import 'package:flutter/material.dart';
import 'package:fittest/features/test_description/presentation/test_description_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme_bloc.dart';

import '../../../resources/strings.dart';
import 'package:fittest/resources/app_colors.dart';

import '../../test_description/presentation/widgets/light_bulb_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.theme;
    final colors = AppColors.getScheme(theme);
    return Scaffold(
      backgroundColor: colors.background,
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
                color: colors.blockBackground,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: colors.headerText,
                      fontFamily: "Raleway",
                    ),
                  ),
                  LightBulbIcon(),
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
                    gradient: LinearGradient(
                      colors: [colors.red, colors.accent],
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
                    colors: colors,
                  ),
                  const SizedBox(height: 16),

                  // Test Item 2
                  TestItem(
                    icon: 'M',
                    title: Strings.testNameMock2,
                    description: Strings.homePageDesc2,
                    buttonText: Strings.startTestButton,
                    gradient: LinearGradient(
                      colors: [colors.accent, colors.yellow],
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
                    colors: colors,
                  ),
                  const SizedBox(height: 16),

                  // Test Item 3
                  TestItem(
                    icon: 'E',
                    title: Strings.testNameMock3,
                    description: Strings.homePageDesc3,
                    buttonText: Strings.startTestButton,
                    gradient: LinearGradient(
                      colors: [colors.yellow, colors.green],
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
                    colors: colors,
                  ),
                  const SizedBox(height: 16),

                  // Results Item
                  TestItem(
                    icon: 'R',
                    title: Strings.results,
                    description: Strings.homepageResDesc,
                    buttonText: Strings.myResultsButton,
                    gradient: LinearGradient(
                      colors: [colors.primary, colors.primary],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    onPressed: () {
                      // Навигация для страницы результатов
                    },
                    colors: colors,
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