import 'package:flutter/material.dart';
import 'package:player_one/core/theming/colors.dart';

class TopGenreTile extends StatelessWidget {
  final String title, imagePath;
  final Color color;

  const TopGenreTile({
    Key? key,
    this.title = 'Unknown',
    this.color = AppColors.accent,
    this.imagePath = 'assets/images/track1.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 4, 4, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Image.asset(imagePath),
          ],
        ),
      ),
    );
  }
}
