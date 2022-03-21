import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';
import 'package:player_one/views/widgets/album_card.dart';
import 'package:player_one/views/widgets/artist_avatar.dart';
import 'package:player_one/views/widgets/genre_tile.dart';
import 'package:player_one/views/widgets/last_played_card.dart';
import 'package:player_one/views/widgets/playlist_card.dart';
import 'package:player_one/views/widgets/track_tile.dart';

class HomeFragment extends StatelessWidget {
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

  final List<String> genres = [
    'Hard Rock',
    'Hip-hop',
    'Pop',
    'Classic',
    'Spatial Audio',
    'Pop',
    'Reggae',
    'Chill',
    'Fitness',
    'Feel Good',
    'Party',
    'Dance',
    'Classical',
    'Rock',
    'Jazz',
    'Alternative',
  ];

  final List<TrackModel> tracks = [
    TrackModel(
      title: 'Chop Suey!',
      artiste: 'System Of A Down',
      duration: '5:32',
    ),
    TrackModel(
      title: 'Gangsta\'s Paradise',
      artiste: 'Coolio',
      duration: '3:21',
    ),
    TrackModel(
      title: 'Slow dancing in the dark',
      artiste: 'Joji',
      duration: '3:20',
    ),
    TrackModel(
      title: 'Eye Of The Tiger',
      artiste: 'Survivor',
      duration: '4:21',
    ),
    TrackModel(
      title: 'Beat it',
      artiste: 'Michael Jackson',
      duration: '5:32',
    ),
  ];

  final List<String> playlists = [
    'Chilled edm',
    '90s Happy Hits',
    'Hard Rock',
  ];

  final List<String> albums = [
    'Teenage fever',
    'Chvmeleon',
    'Bella Buffet',
    'From a Birds Eye View',
    'The Marshall Mathers LP',
    '4 Your Eyez Only',
  ];

  HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20) +
              EdgeInsets.only(top: screenSize.height / 22),
          child: Text(
            'Last played',
            style: Theme.of(context).textTheme.headlineMedium,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Your favorite artists',
            style: Theme.of(context).textTheme.headlineMedium,
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
                    imagePath: 'assets/images/artiste${indicesList[index]}.png',
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Genres',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: screenSize.height / 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: (screenSize.height / 50.2),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => GenreTile(
                genreNumber: index,
                numberOfTracks: 23046,
                genreName: genres[index],
                imagePath: 'assets/images/genre${index + 1}.png',
              ),
              separatorBuilder: (_, index) => const SizedBox(
                width: 15,
              ),
              itemCount: genres.length,
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height / 19,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: screenSize.height / 50,
          ),
          child: Text(
            'Your Tracks',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Column(
          children: List<Padding>.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: screenSize.height / 38),
              child: TrackTile(
                imagePath: 'assets/images/discover${index + 1}.png',
                title: tracks[index].artiste,
                subtitle: tracks[index].title,
                trackDuration: tracks[index].duration,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: screenSize.height / 75,
            left: 20,
            right: 20,
          ),
          child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {
              print('See all pressed');
            },
            child: const Text('See all'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: screenSize.height / 19,
            left: 20,
            right: 20,
            bottom: screenSize.height / 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Playlists',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                'See all',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 14 / 12,
                  color: AppColors.subtitle,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenSize.height / 4,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => PlaylistCard(
              title: (index > 2) ? 'Unknown' : playlists[index],
              imagePath: (index > 1)
                  ? 'assets/images/playlist1.png'
                  : 'assets/images/playlist${index + 1}.png',
            ),
            separatorBuilder: (_, index) => const SizedBox(
              width: 15,
            ),
            itemCount: 6,
          ),
        ),
        SizedBox(
          height: screenSize.height / 19,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Albums',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 28 / 24,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenSize.height / 4,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 20, top: screenSize.height / 50),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => AlbumCard(
              title: (index > 3) ? 'Unknown' : albums[index],
              imagePath: (index > 1)
                  ? 'assets/images/album1.png'
                  : 'assets/images/album${index + 1}.png',
            ),
            separatorBuilder: (_, index) => const SizedBox(
              width: 15,
            ),
            itemCount: 6,
          ),
        ),
        SizedBox(height: screenSize.height / 8)
      ],
    );
  }
}
