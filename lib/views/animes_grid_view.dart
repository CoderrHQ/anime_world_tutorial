import 'package:flutter/material.dart';

import '/api/get_anime_by_ranking_type_api.dart';
import '/core/screens/error_screen.dart';
import '/core/widgets/loader.dart';
import '/models/anime_category.dart';
import '/views/animes_grid_list.dart';

class AnimesGridView extends StatelessWidget {
  const AnimesGridView({
    super.key,
    required this.category,
  });

  final AnimeCategory category;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => getAnimeByRankingTypeApi(
        rankingType: category.rankingType,
        limit: 100,
      ),
      child: FutureBuilder(
        future: getAnimeByRankingTypeApi(
          rankingType: category.rankingType,
          limit: 100,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return loading or shimmer
            return const Loader();
          }

          if (snapshot.data != null) {
            // return data
            return AnimesGridList(
              title: category.title,
              animes: snapshot.data!,
            );
          }

          // If it's not loading but also doesn't have data, it has an error
          return ErrorScreen(
            error: snapshot.error.toString(),
          );
        },
      ),
    );
  }
}
