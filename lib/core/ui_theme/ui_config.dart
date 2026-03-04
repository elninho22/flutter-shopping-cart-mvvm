import 'package:flutter/material.dart';
import '../core_library.dart';



class UiConfigDefault {
  UiConfigDefault._();

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: UiThemeColors.primary,
        ),
        primaryColor: UiThemeColors.primary,
        primaryColorDark: UiThemeColors.darkColor,
        primaryColorLight: UiThemeColors.lightColor,
        appBarTheme:  const AppBarTheme(
          backgroundColor: UiThemeColors.primary,
        ),
      );
}
