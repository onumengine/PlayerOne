import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/core/theming/colors.dart';
import 'package:player_one/core/utils/mock_data.dart';
import 'package:player_one/features/audio_query/domain/use_cases/get_tracks.dart';
import 'package:player_one/features/audio_query/presentation/library_vm.dart';
import 'package:player_one/service_locator.dart';
import 'package:player_one/views/fragments/tracks_preview.dart';
import 'package:player_one/views/widgets/album_card.dart';
import 'package:player_one/views/widgets/artist_avatar.dart';
import 'package:player_one/views/widgets/genre_tile.dart';
import 'package:player_one/views/widgets/last_played_card.dart';
import 'package:player_one/views/widgets/playlist_card.dart';
import 'package:provider/provider.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

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
            height: 42 / 36,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteNames.SEARCH);
            },
            icon: const Hero(
              tag: 'search_icon',
              child: Icon(
                Icons.search,
              ),
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
                  title: lastPlayed[index]['title'],
                  subtitle: lastPlayed[index]['subtitle'],
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
          ChangeNotifierProvider(
            create: (_) => LibraryViewModel(
              getTracks: serviceLocator<GetTracks>(),
            ),
            child: const TracksPreviewFragment(),
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
              children: [
                Text(
                  'Albums',
                  style: Theme.of(context).textTheme.headlineMedium,
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
      ),
    );
  }
}
