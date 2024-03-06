import 'package:flutter/material.dart';

import '../api/get_anime_by_ranking_type_api.dart';
import '/core/screens/error_screen.dart';
import '/core/widgets/loader.dart';
import '/models/anime_category.dart';
import '../views/anime_list_view.dart';

class CategoryanimesScreen extends StatelessWidget {
  const CategoryanimesScreen({
    super.key,
    required this.category,
  });

  final AnimeCategory category;

  static const routeName = '/categories-anime';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeByRankingTypeApi(
        rankingType: category.rankingType,
        limit: 500,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.data != null) {
          final animes = snapshot.data!;
          // .map(
          //   (rankingAnime) => rankingAnime.node,
          // );

          return Scaffold(
            appBar: AppBar(
              title: Text(category.title),
            ),
            body: AnimeListView(
              animes: animes,
            ),
          );
        }

        return ErrorScreen(
          error: snapshot.error.toString(),
        );
      },
    );
  }
}
