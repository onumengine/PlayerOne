import 'package:flutter/material.dart';

class ArtistAvatar extends StatelessWidget {
  final String imagePath;

  const ArtistAvatar({
    Key? key,
    this.imagePath = 'assets/images/artiste1',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(imagePath),
    );
  }
}
