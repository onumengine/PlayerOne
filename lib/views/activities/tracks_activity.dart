import 'package:flutter/material.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/core/utils/colors.dart';
import 'package:player_one/features/audio_query/presentation/library_viewmodel.dart';
import 'package:player_one/views/widgets/track_tile.dart';
import 'package:provider/provider.dart';

class TracksActivity extends StatelessWidget {
  const TracksActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LibraryViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: AppColors.text,
          title: Text(
            'Tracks',
            style: Theme.of(context).textTheme.headlineMedium,
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
        body: (viewModel.state == LibraryState.unfetched)
            ? Container()
            : (viewModel.state == LibraryState.fetching)
                ? const Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ))
                : (viewModel.state == LibraryState.fetched)
                    ? ListView.builder(
                        itemBuilder: (_, index) => TrackTile(
                          title: viewModel.tracks[index].title,
                          subtitle: viewModel.tracks[index].artist,
                          trackDuration: '5:30',
                        ),
                        itemCount: viewModel.tracks.length,
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      ),
      );
    });
  }
}
