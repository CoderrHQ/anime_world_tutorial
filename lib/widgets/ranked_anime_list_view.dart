import 'package:flutter/material.dart';

import '/common/styles/paddings.dart';
import '/widgets/anime_list_tile.dart';
import '/models/anime.dart';

class RankedAnimeListView extends StatelessWidget {
  const RankedAnimeListView({
    super.key,
    required this.animes,
    required this.label,
  });

  final Iterable<Anime> animes;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Padding(
        padding: Paddings.defaultPadding,
        child: ListView.builder(
          itemCount: animes.length,
          itemBuilder: (context, index) {
            final anime = animes.elementAt(index);
            return AnimeListTile(
              anime: anime,
              rank: anime.ranking!.rank,
            );
          },
        ),
      ),
    );
  }
}
