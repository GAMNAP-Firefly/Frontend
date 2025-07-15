import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTheme { light, dark, red }

class ThemeState {
  final AppTheme theme;
  ThemeState(this.theme);
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(AppTheme.light));

  void nextTheme() {
    switch (state.theme) {
      case AppTheme.light:
        emit(ThemeState(AppTheme.dark));
        break;
      case AppTheme.dark:
        emit(ThemeState(AppTheme.red));
        break;
      case AppTheme.red:
        emit(ThemeState(AppTheme.light));
        break;
    }
  }

  void setTheme(AppTheme theme) => emit(ThemeState(theme));
} 