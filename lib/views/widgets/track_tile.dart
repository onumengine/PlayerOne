import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/core/theming/colors.dart';
import 'package:player_one/features/audio_query/domain/entities/track.dart';
import 'package:player_one/features/playback/presentation/playback_vm.dart';
import 'package:provider/provider.dart';

class TrackTile extends StatelessWidget {
  final TrackEntity track;

  const TrackTile({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double vw = MediaQuery.of(context).size.width;
    return ListTile(
      onTap: () async {
        Provider.of<PlaybackViewModel>(context, listen: false)
          ..play(track.filePath)
          ..setIsPlaying(true);
      },
      onLongPress: () async {
        Provider.of<PlaybackViewModel>(context, listen: false)
          ..stop()
          ..setIsPlaying(false);
      },
      leading: track.albumArtPath == null
          ? Image.asset(
              'assets/images/playlist1.png',
              width: 0.15 * vw,
              fit: BoxFit.cover,
            )
          : Image.file(
              File(track.albumArtPath),
              width: 0.15 * vw,
              fit: BoxFit.cover,
            ),
      title: Text(
        track.title,
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
        track.artist,
        style: const TextStyle(
          height: 16 / 14,
          color: AppColors.subtitle3,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        track.duration,
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
