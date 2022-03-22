import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';

enum RepeatMode {
  off,
  all,
  one,
}

class NowPlayingControlPanel extends StatefulWidget {
  final String title, artist;

  const NowPlayingControlPanel({
    Key? key,
    required this.title,
    required this.artist,
  }) : super(key: key);

  @override
  State<NowPlayingControlPanel> createState() => _NowPlayingControlPanelState();
}

class _NowPlayingControlPanelState extends State<NowPlayingControlPanel> {
  String _title = '';
  String _artist = '';
  double _trackProgress = 0.5;
  bool _shuffleIsOn = false;
  bool _isPaused = false;
  RepeatMode _repeatMode = RepeatMode.off;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _artist = widget.artist;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            _title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 33 / 28,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _artist,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 21 / 18,
              color: AppColors.subtitle3,
            ),
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: _trackProgress,
            backgroundColor: AppColors.progressIndicatorBackground,
            color: _isPaused
                ? AppColors.fullOrange
                : AppColors.progressIndicatorForeground,
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.shuffle,
                    color: _shuffleIsOn
                        ? AppColors.activeToolbarIcon
                        : AppColors.text,
                  ),
                ),
                const Expanded(
                  flex: 11,
                  child: SizedBox(),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.skip_previous_rounded,
                    color: AppColors.subtitle,
                  ),
                ),
                const Expanded(
                  flex: 5,
                  child: SizedBox(),
                ),
                MaterialButton(
                  minWidth: 60,
                  height: 60,
                  onPressed: () {
                    setState(() {
                      _isPaused = !_isPaused;
                    });
                  },
                  child: Icon(
                    _isPaused ? CupertinoIcons.play_fill : CupertinoIcons.pause_fill,
                    color: AppColors.text,
                  ),
                  color:
                      _isPaused ? AppColors.fullOrange : AppColors.pauseButton,
                  textColor: AppColors.text,
                  shape: const CircleBorder(),
                ),
                const Expanded(
                  flex: 5,
                  child: SizedBox(),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.skip_next_rounded,
                    color: AppColors.subtitle,
                  ),
                ),
                const Expanded(
                  flex: 11,
                  child: SizedBox(),
                ),
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.repeat_1,
                    color: (_repeatMode == RepeatMode.off)
                        ? AppColors.text
                        : AppColors.activeToolbarIcon,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share_outlined,
                  color: AppColors.text,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.playlist_play_rounded,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
