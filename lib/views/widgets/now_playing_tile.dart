import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_one/core/theming/colors.dart';
import 'package:player_one/core/utils/mock_data.dart';

class NowPlayingTile extends StatelessWidget {
  const NowPlayingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size.fromHeight(screenSize.height * 0.08),
      child: Container(
        decoration: const BoxDecoration(
          //color: Theme.of(context).scaffoldBackgroundColor,
          color: AppColors.cardBackground,
        ),
        height: screenSize.height * 0.08,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenSize.height * 0.01,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screenSize.height * 0.008,
                    ),
                    height: screenSize.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          nowPlayingState['albumArt'],
                          height: screenSize.height * 0.05,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: screenSize.height * 0.001,
                                ),
                                child: Text(
                                  nowPlayingState['title'],
                                  style: const TextStyle(
                                    color: AppColors.text,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.005,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: screenSize.height * 0.003,
                                ),
                                child: Text(
                                  nowPlayingState['artist'],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: AppColors.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          print('pressed button');
                        },
                        icon: const Icon(
                          CupertinoIcons.pause_fill,
                          color: AppColors.text,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print('pressed button');
                        },
                        icon: const Icon(
                          CupertinoIcons.forward_fill,
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              child: LinearProgressIndicator(
                value: nowPlayingState['progressPercent'],
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
