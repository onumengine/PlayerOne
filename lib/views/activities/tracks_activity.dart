import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_one/core/navigation/routenames.dart';
import 'package:player_one/core/theming/colors.dart';
import 'package:player_one/features/audio_query/presentation/library_vm.dart';
import 'package:player_one/views/widgets/now_playing_tile.dart';
import 'package:player_one/views/widgets/track_tile.dart';
import 'package:provider/provider.dart';

class TracksActivity extends StatefulWidget {
  const TracksActivity({Key? key}) : super(key: key);

  @override
  State<TracksActivity> createState() => _TracksActivityState();
}

class _TracksActivityState extends State<TracksActivity> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LibraryViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          extendBody: true,
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
                fontStyle: FontStyle.italic,
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
                            track: viewModel.tracks[index],
                          ),
                          itemCount: viewModel.tracks.length,
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        ),
          bottomNavigationBar: const NowPlayingTile(),
        );
      },
    );
  }
}
