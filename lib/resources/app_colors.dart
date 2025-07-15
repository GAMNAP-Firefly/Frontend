import 'package:flutter/material.dart';
import '../theme/theme_bloc.dart';

abstract class AppColorsScheme {
  Color get background;
  Color get blockBackground;
  Color get headerText;
  Color get questionText;
  Color get buttonText;
  Color get progressBar;
  Color get progressBarSecondary;
  Color get primary;
  Color get secondary;
  Color get accent;
  Color get yellow;
  Color get green;
  Color get red;
  Color get darkGrey;
  Color get lightGrey;
  Color get textDark;
  Color get button1;
  Color get button2;
  Color get button3;
  Color get button4;
}

class AppColorsLight implements AppColorsScheme {
  @override
  Color get background => const Color(0xFFECEFF4);
  @override
  Color get blockBackground => Colors.white;
  @override
  Color get headerText => const Color(0xFF3D4853);
  @override
  Color get questionText => const Color(0xFF737E8A);
  @override
  Color get buttonText => Colors.white;
  @override
  Color get progressBar => const Color(0xFF8FBCBB);
  @override
  Color get progressBarSecondary => const Color(0xFFD8DEE9);
  @override
  Color get primary => const Color(0xFF8FBCBB);
  @override
  Color get secondary => const Color(0xFF88B2D0);
  @override
  Color get accent => const Color(0xFFD08770);
  @override
  Color get yellow => const Color(0xFFEBCB8B);
  @override
  Color get green => const Color(0xFFA3BE8C);
  @override
  Color get red => const Color(0xFFBF616A);
  @override
  Color get darkGrey => const Color(0xFF3D4853);
  @override
  Color get lightGrey => const Color(0xFF737E8A);
  @override
  Color get textDark => const Color(0xFF2E3440);
  @override
  Color get button1 => const Color(0xFF8FBCBB);
  @override
  Color get button2 => const Color(0xFF88B2D0);
  @override
  Color get button3 => const Color(0xFFD08770);
  @override
  Color get button4 => const Color(0xFFEBCB8B);
}

class AppColorsDark implements AppColorsScheme {
  @override
  Color get background => const Color(0xFF2E3440);
  @override
  Color get blockBackground => const Color(0xFF3B4252);
  @override
  Color get headerText => Colors.white;
  @override
  Color get questionText => Colors.white;
  @override
  Color get buttonText => Colors.white;
  @override
  Color get progressBar => const Color(0xFF8FBCBB);
  @override
  Color get progressBarSecondary => const Color(0xFF2E3440);
  @override
  Color get primary => const Color(0xFF8FBCBB);
  @override
  Color get secondary => const Color(0xFF88B2D0);
  @override
  Color get accent => const Color(0xFFD08770);
  @override
  Color get yellow => const Color(0xFFEBCB8B);
  @override
  Color get green => const Color(0xFFA3BE8C);
  @override
  Color get red => const Color(0xFFBF616A);
  @override
  Color get darkGrey => Colors.white;
  @override
  Color get lightGrey => Colors.white;
  @override
  Color get textDark => Colors.white;
  @override
  Color get button1 => const Color(0xFF8FBCBB);
  @override
  Color get button2 => const Color(0xFF88B2D0);
  @override
  Color get button3 => const Color(0xFFD08770);
  @override
  Color get button4 => const Color(0xFFEBCB8B);
}

class AppColorsRed implements AppColorsScheme {
  @override
  Color get background => const Color(0xFFEFE9D9);
  @override
  Color get blockBackground => Colors.white;
  @override
  Color get headerText => const Color(0xFF7D5F5D);
  @override
  Color get questionText => const Color(0xFF483534);
  @override
  Color get buttonText => Colors.white;
  @override
  Color get progressBar => const Color(0xFFF49BA1);
  @override
  Color get progressBarSecondary => const Color(0xFFEFE9D9);
  @override
  Color get primary => const Color(0xFFF49BA1);
  @override
  Color get secondary => const Color(0xFFF2AEAD);
  @override
  Color get accent => const Color(0xFFD08389);
  @override
  Color get yellow => const Color(0xFFF2AEAD);
  @override
  Color get green => const Color(0xFFB27175);
  @override
  Color get red => const Color(0xFFD08389);
  @override
  Color get darkGrey => const Color(0xFF7D5F5D);
  @override
  Color get lightGrey => const Color(0xFF483534);
  @override
  Color get textDark => const Color(0xFF483534);
  @override
  Color get button1 => const Color(0xFFB27175);
  @override
  Color get button2 => const Color(0xFFD08389);
  @override
  Color get button3 => const Color(0xFFF49BA1);
  @override
  Color get button4 => const Color(0xFFF2AEAD);
}

class AppColors {
  static AppColorsScheme getScheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.dark:
        return AppColorsDark();
      case AppTheme.red:
        return AppColorsRed();
      default:
        return AppColorsLight();
    }
  }
} 