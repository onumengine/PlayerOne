import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
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
      onTap: () {
        Navigator.of(context).pushNamed(RouteNames.NOW_PLAYING);
      },
      leading: Image.asset(imagePath),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 19 / 16,
          color: AppColors.text,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          height: 16 / 14,
          color: AppColors.subtitle3,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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

class SearchTrackTile extends StatelessWidget {
  final String imagePath, title, subtitle, trackDuration;

  const SearchTrackTile({
    Key? key,
    this.title = 'Unknown',
    this.subtitle = 'Unknown',
    this.imagePath = 'assets/images/resulttrack1.png',
    this.trackDuration = 'title',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(RouteNames.NOW_PLAYING);
      },
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(imagePath),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 19 / 16,
          color: AppColors.text,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          height: 16 / 14,
          color: AppColors.subtitle3,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: PopupMenuButton(
        color: AppColors.flatButtonText,
        icon: Icon(
          Icons.more_horiz,
          color: AppColors.text.withOpacity(0.5),
        ),
        itemBuilder: (_) => <PopupMenuItem>[
          const PopupMenuItem<String>(
            child: Text('Option'),
          ),
          const PopupMenuItem<String>(
            child: Text('Option'),
          ),
          const PopupMenuItem<String>(
            child: Text('Option'),
          ),
          const PopupMenuItem<String>(
            child: Text('Option'),
          ),
        ],
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
