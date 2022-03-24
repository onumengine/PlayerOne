import 'package:flutter/material.dart';
import 'package:player_one/features/audio_query/presentation/library_viewmodel.dart';
import 'package:player_one/views/widgets/track_tile.dart';
import 'package:provider/provider.dart';

class TracksPreviewFragment extends StatelessWidget {
  const TracksPreviewFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Consumer<LibraryViewModel>(
      builder: (context, viewModel, child) => Column(
        children: (viewModel.state == LibraryState.fetched)
            ? [
                ...List<Padding>.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: screenSize.height / 38),
                    child: TrackTile(
                      imagePath: 'assets/images/discover${index + 1}.png',
                      title: viewModel.tracks[index].artist,
                      subtitle: viewModel.tracks[index].title,
                      trackDuration: '5:32',
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
                    child: SizedBox(
                      width: screenSize.width,
                      child: const Center(
                        child: Text('See all'),
                      ),
                    ),
                  ),
                ),
              ]
            : [
                const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
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
              ],
      ),
    );
  }
}