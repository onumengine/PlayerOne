import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';

class GenreTile extends StatelessWidget {
  final int genreNumber, numberOfTracks;
  final String genreName;

  const GenreTile({
    Key? key,
    this.genreNumber = 1,
    this.numberOfTracks = 0,
    this.genreName = 'Unknown',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 180,
      width: 160,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 8/9,
                children: List.generate(
                  4,
                  (index) => Image.asset(
                    'assets/images/genre${genreNumber}_${index + 1}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: screenSize.height / 18,
              child: Text(
                genreName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 23 / 20,
                  color: AppColors.text,
                ),
              ),
            ),
            Positioned(
              bottom: screenSize.height / 38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 14,
                  ),
                  Text(
                    '$numberOfTracks Tracks',
                    style: const TextStyle(
                      height: 16 / 14,
                      color: AppColors.subtitle2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
