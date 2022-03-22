import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';

class CategoryTile extends StatelessWidget {
  final String title, imagePath;
  final VoidCallback onTap;

  const CategoryTile({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.searchbarBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
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
          Expanded(
            flex: 1,
            child: Image.asset(imagePath, fit: BoxFit.fill,),
          ),
        ],
      ),
    );
  }
}
