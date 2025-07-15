import 'package:fittest/features/home/presentation/home_page_pc.dart';
import 'package:fittest/resources/strings.dart';
import 'package:flutter/material.dart';
import 'features/home/presentation/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/theme_bloc.dart';
import 'resources/app_colors.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final colors = AppColors.getScheme(state.theme);
        return MaterialApp(
          title: Strings.title,
          theme: ThemeData(
            scaffoldBackgroundColor: colors.background,
          ),
          home: const HomePagePc(),
        );
      },
    );
  }
}
