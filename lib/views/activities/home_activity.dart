import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_one/core/utils/colors.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20) + EdgeInsets.only(top: screenSize.height / 22),
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
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
