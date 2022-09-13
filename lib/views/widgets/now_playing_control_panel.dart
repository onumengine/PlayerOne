import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_one/core/theming/colors.dart';
import 'package:player_one/features/playback/presentation/playback_vm.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Consumer<PlaybackViewModel>(
      builder: (context, viewmodel, child) {
        return Container(
          width: screenSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                viewmodel.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  height: 33 / 28,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                viewmodel.artist,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 21 / 18,
                  color: AppColors.subtitle3,
                ),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: viewmodel.progress,
                backgroundColor: AppColors.progressIndicatorBackground,
                color: viewmodel.isPlaying
                    ? AppColors.progressIndicatorForeground
                    : AppColors.fullOrange,
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
                        color: viewmodel.shuffle
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
                      onPressed: viewmodel.isPlaying
                          ? viewmodel.pause()
                          : viewmodel.resume(),
                      child: Icon(
                        viewmodel.isPlaying
                            ? CupertinoIcons.pause_fill
                            : CupertinoIcons.play_fill,
                        color: AppColors.text,
                      ),
                      color: viewmodel.isPlaying
                          ? AppColors.pauseButton
                          : AppColors.fullOrange,
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
                        color: (viewmodel.repeatMode == RepeatMode.off)
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
      },
    );
  }
}
