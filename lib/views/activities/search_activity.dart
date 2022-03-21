import 'package:flutter/material.dart';
import 'package:player_one/core/utils/colors.dart';
import 'package:player_one/views/fragments/search_results.dart';
import 'package:player_one/views/widgets/custom_chip.dart';
import 'package:player_one/views/widgets/track_tile.dart';

class SearchActivity extends StatelessWidget {
  SearchActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.searchbarBackground,
        foregroundColor: AppColors.text,
        bottomOpacity: 1,
        toolbarOpacity: 1,
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
                height: kToolbarHeight,
              ),
              const Hero(
                tag: 'search_icon',
                child: Icon(
                  Icons.search,
                  color: AppColors.text,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search music',
                    hintStyle: TextStyle(
                      color: AppColors.flatButtonText.withOpacity(0.5),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  style: const TextStyle(
                    color: AppColors.flatButtonText,
                    fontWeight: FontWeight.w300,
                    height: 16 / 14,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    height: 16 / 14,
                    color: AppColors.flatButtonText,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
      body: SearchResultsFragment(),
    );
  }
}
