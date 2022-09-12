import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:player_one/core/theming/colors.dart';
import 'package:player_one/views/widgets/now_playing_control_panel.dart';

class NowPlayingActivity extends StatelessWidget {
  final String currentTrackImagePath;

  const NowPlayingActivity({
    Key? key,
    this.currentTrackImagePath = 'assets/images/nowplaying.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                currentTrackImagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 11,
            left: 20,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              fillColor: AppColors.scaffoldBackground.withOpacity(0.1),
              child: const Icon(
                Icons.chevron_left,
                color: AppColors.text,
              ),
              shape: const CircleBorder(),
              constraints: const BoxConstraints(
                minHeight: 41,
                minWidth: 41,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 11,
            right: 10,
            child: PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.text,
              ),
              color: AppColors.subtitle,
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
          ),
          const Positioned(
            bottom: 0,
            child: NowPlayingControlPanel(
              title: 'Gorillaz',
              artist: 'Feel Good Inc',
            ),
          ),
        ],
      ),
    );
  }
}
