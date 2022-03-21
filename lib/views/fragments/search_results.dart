import 'package:flutter/material.dart';
import 'package:player_one/views/widgets/custom_chip.dart';
import 'package:player_one/views/widgets/track_tile.dart';

class SearchResultsFragment extends StatelessWidget {
  final List<TrackModel> _tracks = [
    TrackModel(title: 'Whoopa', artiste: 'Party Next Door', duration: '3:52'),
    TrackModel(
        title: 'Love Me Again', artiste: 'John Newman', duration: '4:02'),
    TrackModel(
        title: 'Him and I', artiste: 'G-Eazy & Halsey', duration: '3:52'),
  ];

  SearchResultsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomChip(
                  title: 'Tracks',
                  onTap: (value) {
                    print(value);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomChip(
                  title: 'Albums',
                  onTap: (value) {
                    print(value);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomChip(
                  title: 'Playlists',
                  onTap: (value) {
                    print(value);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.height / 19,
              left: 20,
              bottom: screenSize.height / 38,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Tracks',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20) +
                EdgeInsets.only(bottom: screenSize.height / 25.1),
            child: Column(
              children: [
                SearchTrackTile(
                  title: _tracks[0].title,
                  subtitle: _tracks[0].artiste,
                  imagePath: 'assets/images/resulttrack1.png',
                ),
                SizedBox(
                  height: screenSize.height / 38,
                ),
                SearchTrackTile(
                  title: _tracks[1].title,
                  subtitle: _tracks[1].artiste,
                  imagePath: 'assets/images/resulttrack2.png',
                ),
                SizedBox(
                  height: screenSize.height / 38,
                ),
                SearchTrackTile(
                  title: _tracks[2].title,
                  subtitle: _tracks[2].artiste,
                  imagePath: 'assets/images/resulttrack3.png',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: const Center(
                child: Text('View all'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.height / 19,
              left: 20,
              bottom: screenSize.height / 38,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Playlist',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20) +
                EdgeInsets.only(bottom: screenSize.height / 25.1),
            child: Column(
              children: [
                const SearchTrackTile(
                  title: 'Eliver',
                  subtitle: 'Sisqicious Mindas: 60',
                  imagePath: 'assets/images/resultplaylist1.png',
                ),
                SizedBox(
                  height: screenSize.height / 38,
                ),
                const SearchTrackTile(
                  title: 'by kildery',
                  subtitle: 'Sistem of the down',
                  imagePath: 'assets/images/resultplaylist2.png',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: const Center(
                child: Text('View all'),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 50,
          ),
        ],
      ),
    );
  }
}
