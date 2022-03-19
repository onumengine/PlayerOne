import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';

// TODO: use a hero to animate the first track tile into the TracksFragment when 'see all' is clicked
class TrackTile extends StatelessWidget {
  final String imagePath, title, subtitle, trackDuration;

  const TrackTile({
    Key? key,
    this.title = 'Unknown',
    this.subtitle = 'Unknown',
    this.imagePath = 'assets/images/discover1.png',
    this.trackDuration = 'title',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 19 / 16,
          color: AppColors.text,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          height: 16 / 14,
          color: AppColors.subtitle3,
        ),
      ),
      trailing: Text(
        trackDuration,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 14 / 12,
          color: AppColors.subtitle4,
        ),
      ),
    );
  }
}

class TrackModel {
  final String title, artiste, duration;

  TrackModel({
    required this.title,
    required this.artiste,
    required this.duration,
  });
}
