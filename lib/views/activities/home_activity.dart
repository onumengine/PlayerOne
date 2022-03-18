import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_one/core/utils/colors.dart';
import 'package:player_one/views/widgets/artist_avatar.dart';
import 'package:player_one/views/widgets/last_played_card.dart';

class HomeActivity extends StatelessWidget {
  final List<Map<String, String>> data = [
    <String, String>{
      'title': 'Discover Weekly',
      'subtitle': 'Your weekly mixtape of fresh music. Enjoy',
    },
    <String, String>{
      'title': 'Party hits',
      'subtitle': 'A mix of the biggest pop, dance, and hip hop...',
    }
  ];

  final List<int> indicesList = [
    1,
    2,
    3,
    1,
    2,
    3,
  ];

  HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: AppColors.text,
        title: Text(
          'Music',
          style: GoogleFonts.roboto(
            color: AppColors.text,
            fontSize: 36,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            height: 42 / 36,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20) +
                EdgeInsets.only(top: screenSize.height / 22),
            child: const Text(
              'Last played',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.text,
                height: 23 / 20,
              ),
            ),
          ),
          SizedBox(
            width: screenSize.width,
            height: screenSize.height / 3.5,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20) +
                  const EdgeInsets.only(top: 15),
              itemBuilder: (_, index) {
                int pathSuffixIndex = index + (index + (index + 1));
                return LastPlayedCard(
                  path1: 'assets/images/lastplayed$pathSuffixIndex.png',
                  path2: 'assets/images/lastplayed${pathSuffixIndex + 1}.png',
                  path3: 'assets/images/lastplayed${pathSuffixIndex + 2}.png',
                  title: data[index]['title'],
                  subtitle: data[index]['subtitle'],
                );
              },
              separatorBuilder: (_, index) => const SizedBox(
                width: 15,
              ),
              itemCount: 2,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: screenSize.height / 19,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Your favorite artists',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 23 / 20,
                color: AppColors.text,
              ),
            ),
          ),
          SizedBox(
            height: 100 + screenSize.height / 25.1,
            child: Padding(
              padding: EdgeInsets.only(
                top: (screenSize.height / 50.2),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: (index == 0)
                        ? const EdgeInsets.only(left: 20)
                        : const EdgeInsets.only(left: 15),
                    child: ArtistAvatar(
                      imagePath:
                          'assets/images/artiste${indicesList[index]}.png',
                    ),
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                  width: 15,
                ),
                itemCount: indicesList.length,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 19,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Genres',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 23 / 20,
                color: AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
