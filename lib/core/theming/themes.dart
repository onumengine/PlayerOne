import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_one/core/theming/colors.dart';

ThemeData theme = ThemeData(
  primarySwatch: MaterialAppColors.accentMaterial,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.scaffoldBackground,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.text,
      height: 23 / 20,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 16 / 14,
        ),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(49),
        ),
      ),
      fixedSize: MaterialStateProperty.all<Size>(
        const Size.fromHeight(44),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        AppColors.text,
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        AppColors.text.withOpacity(0.1),
      ),
    ),
  ),
  fontFamily: GoogleFonts.roboto().fontFamily,
);
