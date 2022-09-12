import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/features/audio_query/presentation/library_vm.dart';
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
                      track: viewModel.tracks[index],
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
                      Navigator.of(context).pushNamed(RouteNames.TRACKS);
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
                      Navigator.of(context).pushNamed(RouteNames.TRACKS);
                    },
                    child: const Text('See all'),
                  ),
                ),
              ],
      ),
    );
  }
}
