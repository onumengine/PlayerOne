import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:player_one/views/widgets/gradient.dart';
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
