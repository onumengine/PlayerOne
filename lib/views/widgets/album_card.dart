import 'package:flutter/material.dart';
import 'package:player_one/core/theming/colors.dart';

class AlbumCard extends StatelessWidget {
  final String? imagePath, title, numberOfTracks;

  const AlbumCard({
    Key? key,
    this.imagePath,
    this.title,
    this.numberOfTracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      child: SizedBox(
        height: screenSize.height / 4,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Opacity(
              opacity: 0.8,
              child: Image.asset(
                imagePath ?? 'assets/images/album1.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: screenSize.height / 19,
              child: Text(
                title ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 19 / 16,
                  color: AppColors.text,
                ),
              ),
            ),
            Positioned(
              bottom: screenSize.height / 38,
              child: SizedBox(
                child: Row(
                  children: [
                    const Icon(
                      Icons.music_note,
                      color: AppColors.text,
                      size: 10,
                    ),
                    Text(
                      '${numberOfTracks ?? 0} Tracks',
                      style: const TextStyle(
                          fontSize: 12,
                          height: 14 / 12,
                          color: AppColors.text,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
