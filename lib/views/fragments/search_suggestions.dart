import 'package:flutter/material.dart';
import 'package:player_one/core/theming/colors.dart';
import 'package:player_one/views/widgets/category_tile.dart';
import 'package:player_one/views/widgets/top_genre_tile.dart';

class SearchSuggestionsFragment extends StatelessWidget {
  final List<String> _genres = [
    'Pop',
    'Jazz',
    'Hard Rock',
    'Hip Hop',
    'Classic',
    'Rock',
  ];

  final List<Color> _colors = [
    AppColors.fullPink,
    AppColors.fullOrange,
    AppColors.fullSkyBlue,
    AppColors.fullGreen,
    AppColors.fullPurple,
    AppColors.fullDeepBlue,
  ];

  final List<String> _categories = [
    'Podcasts',
    'Radio',
    'Mood',
    'In car',
    'Discover',
    'Workout',
  ];

  SearchSuggestionsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height / 25.1,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: screenSize.height / 38,
              ),
              child: Text(
                'Your top genres',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          /*
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 241,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                childAspectRatio: 160 / 67,
                children: List.generate(
                  _genres.length,
                  (index) => TopGenreTile(
                    title: _genres[index],
                    imagePath: 'assets/images/topgenre${index + 1}.png',
                    color: _colors[index],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 19,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: screenSize.height / 38,
              ),
              child: Text(
                'Browse all',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 241,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                childAspectRatio: 160 / 67,
                children: List.generate(
                  _categories.length,
                  (index) => CategoryTile(
                    title: _categories[index],
                    imagePath: 'assets/images/category${index + 1}.png',
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ),
          */
          Container(
            height: 67,
            width: screenSize.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TopGenreTile(
                    title: _genres[0],
                    imagePath: 'assets/images/topgenre${1}.png',
                    color: _colors[0],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: TopGenreTile(
                    title: _genres[1],
                    imagePath: 'assets/images/topgenre${2}.png',
                    color: _colors[1],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 67,
            width: screenSize.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TopGenreTile(
                    title: _genres[2],
                    imagePath: 'assets/images/topgenre${3}.png',
                    color: _colors[2],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: TopGenreTile(
                    title: _genres[3],
                    imagePath: 'assets/images/topgenre${4}.png',
                    color: _colors[3],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 67,
            width: screenSize.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TopGenreTile(
                    title: _genres[4],
                    imagePath: 'assets/images/topgenre${5}.png',
                    color: _colors[4],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: TopGenreTile(
                    title: _genres[5],
                    imagePath: 'assets/images/topgenre${6}.png',
                    color: _colors[5],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height / 19,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: screenSize.height / 38,
              ),
              child: Text(
                'Browse all',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Container(
            height: 67,
            width: screenSize.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CategoryTile(
                    title: _categories[0],
                    imagePath: 'assets/images/category${1}.png',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: CategoryTile(
                    title: _categories[1],
                    imagePath: 'assets/images/category${2}.png',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height / 38,
          ),
          Container(
            height: 67,
            width: screenSize.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CategoryTile(
                    title: _categories[2],
                    imagePath: 'assets/images/category${3}.png',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: CategoryTile(
                    title: _categories[3],
                    imagePath: 'assets/images/category${4}.png',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height / 38,
          ),
          Container(
            height: 67,
            width: screenSize.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CategoryTile(
                    title: _categories[4],
                    imagePath: 'assets/images/category${5}.png',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: CategoryTile(
                    title: _categories[5],
                    imagePath: 'assets/images/category${6}.png',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height / 38,
          ),
        ],
      ),
    );
  }
}
