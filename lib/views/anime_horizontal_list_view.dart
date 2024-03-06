import 'package:flutter/material.dart';

import '/common/styles/text_styles.dart';
import '/models/anime_node.dart';
import '/screens/anime_details_screen.dart';
import '/widgets/anime_tile.dart';

class AnimeHorizontalListView extends StatelessWidget {
  const AnimeHorizontalListView({
    super.key,
    required this.title,
    required this.animes,
  });

  final String title;
  final List<AnimeNode> animes;

  @override
  Widget build(BuildContext context) {
    return animes.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.largeText,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  itemCount: animes.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    final anime = animes[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AnimeDetailsScreen.routeName,
                          arguments: anime.id,
                        );
                      },
                      child: AnimeTile(anime: anime),
                    );
                  },
                ),
              ),
            ],
          )
        : Center(
            child: WhiteContainer(
              child: Text(
                'No $title',
                style: TextStyles.mediumText,
              ),
            ),
          );
  }
}
