import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';

enum ChipState {
  active,
  inactive,
}

class CustomChip extends StatefulWidget {
  final double borderRadius;
  final String title;
  final TextStyle? textStyle;
  final void Function(bool isActive) onTap;

  const CustomChip({
    Key? key,
    this.borderRadius = 34,
    required this.title,
    this.textStyle,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isActive = !_isActive;
          widget.onTap(_isActive);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: _isActive
              ? AppColors.accent
              : AppColors.searchbarBackground,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 18,
        ),
        child: Text(
          widget.title,
          style: widget.textStyle ??
              TextStyle(
                fontSize: 12,
                height: 16 / 12,
                color: _isActive
                    ? AppColors.scaffoldBackground
                    : AppColors.text,
              ),
        ),
      ),
    );
  }
}
