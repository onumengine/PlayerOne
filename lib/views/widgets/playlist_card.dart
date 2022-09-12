import 'package:flutter/material.dart';
import 'package:player_one/core/theming/colors.dart';

class PlaylistCard extends StatelessWidget {
  final String? imagePath, title;

  const PlaylistCard({
    Key? key,
    this.imagePath,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: SizedBox(
        height: screenSize.height / 4,
        width: screenSize.width / 3,
        child: Column(
          children: [
            Expanded(
              flex: 108,
              child: Image.asset(
                imagePath ?? 'assets/images/playlist1.png',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              flex: 43,
              child: Container(
                color: AppColors.text.withOpacity(0.1),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 15,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Text(
                      title ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 14 / 12,
                        color: AppColors.text,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
