import 'package:flutter/material.dart';

import '/api/get_anime_by_ranking_type_api.dart';
import '/core/widgets/loader.dart';
import '/screens/anime_details_screen.dart';
import '/screens/view_all_animes_screen.dart';
import '/widgets/anime_tile.dart';

class FeaturedAnimes extends StatelessWidget {
  const FeaturedAnimes({
    Key? key,
    required this.rankingType,
    required this.label,
  }) : super(key: key);

  final String rankingType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeByRankingTypeApi(rankingType: rankingType, limit: 10),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.hasData) {
          final animes = snapshot.data!;
          return Column(
            children: [
              // Popular
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ViewAllAnimesScreen.routeName,
                          arguments: {
                            'rankingType': rankingType,
                            'label': label,
                          },
                        );
                      },
                      child: const Text('View all'),
                    ),
                  ],
                ),
              ),
              // Horizontal Anime Slider
              SizedBox(
                height: 300,
                child: ListView.separated(
                  itemCount: animes.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    final anime = animes.elementAt(index);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AnimeDetailsScreen.routeName,
                          arguments: anime.node.id,
                        );
                      },
                      child: AnimeTile(
                        anime: anime.node,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return Text(
          snapshot.error.toString(),
        );
      },
    );
  }
}
