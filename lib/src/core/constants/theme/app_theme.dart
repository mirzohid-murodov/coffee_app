import 'package:coffee_mobile/src/core/constants/color/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  static ThemeMode themeMode = ThemeMode.system;

  ThemeMode get themeModer => themeMode;

  set themeModer(ThemeMode themeModer) {
    themeMode = themeModer;
    notifyListeners();
  }

  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    scaffoldBackgroundColor: AppColors.white,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(32),
        iconColor: WidgetStatePropertyAll(AppColors.primary),
      ),
    ),
  );

  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    scaffoldBackgroundColor: AppColors.black,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(32),
        iconColor: WidgetStatePropertyAll(AppColors.primary),
      ),
    ),
  );
}
