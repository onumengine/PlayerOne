import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/core/navigation/router.dart';
import 'package:player_one/core/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Player One',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialAppColors.accentMaterial,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffoldBackground,
        ),
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      initialRoute: RouteNames.HOME,
      onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
    );
  }
}

