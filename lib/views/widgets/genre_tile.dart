import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';

class GenreTile extends StatelessWidget {
  final int genreNumber, numberOfTracks;
  final String genreName, imagePath;

  const GenreTile({
    Key? key,
    this.genreNumber = 1,
    this.numberOfTracks = 0,
    this.genreName = 'Unknown',
    this.imagePath = 'assets/images/genre2.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: SizedBox(
        width: screenSize.width / 2.34,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                genreName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 19 / 16,
                  color: AppColors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
