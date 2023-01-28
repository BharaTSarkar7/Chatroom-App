import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const blueSecondary = Color(0xFF1e96fc);
  static const purpleSecondary = Color(0xFFe0aaff);
  static const dividerColor = Color(0xFF252D32);
  static const accent = Color(0xFFe71d36);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFf8f9fa);
  static const iconDark = Color(0xFF343a40);
  static const textHighlight = blueSecondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
  static const mobileBackgroundColorDark = Color(0xFF131C21);
  static const mobileBackgroundColorLight = Color(0xfffdfffc);
  static const svgColorLight = Colors.white;
  static const svgColorDark = Colors.black;
}

abstract class _LightColors {
  static const background = AppColors.mobileBackgroundColorLight;

  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = AppColors.mobileBackgroundColorDark;

  static const card = AppColors.cardDark;
}

/// Reference to the application theme.

class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  /// Light theme and its settings.
  ThemeData get light => ThemeData(
        focusColor: AppColors.svgColorDark,
        primaryColor: AppColors.blueSecondary,
        brightness: Brightness.light,
        colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
        backgroundColor: _LightColors.background,
        appBarTheme: lightBase.appBarTheme.copyWith(
          iconTheme: lightBase.iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: AppColors.textDark,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        scaffoldBackgroundColor: _LightColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueSecondary),
        ),
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
      );

  /// Dark theme and its settings.
  ThemeData get dark => ThemeData(
        focusColor: AppColors.svgColorLight,
        primaryColor: AppColors.purpleSecondary,
        brightness: Brightness.dark,
        colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLigth),
        backgroundColor: _DarkColors.background,
        appBarTheme: darkBase.appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purpleSecondary),
        ),
        cardColor: _DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLigth),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
      );
}
