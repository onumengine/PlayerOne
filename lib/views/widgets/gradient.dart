import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';

class PlayerGradient extends StatelessWidget {
  const PlayerGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 1.51,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment(0, 0.3),
          colors: [
            AppColors.scaffoldBackground,
            Color(0XFF5A5555),
          ],
        ),
      ),
    );
  }
}
