import 'package:flutter/material.dart';
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
      theme: ThemeData(
        primarySwatch: MaterialAppColors.accentMaterial,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
      home: const SizedBox.expand(
        child: Center(
          child: Text('PlayerOne'),
        ),
      ),
    );
  }
}

