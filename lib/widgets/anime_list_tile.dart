import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/screens/anime_details_screen.dart';
import '/models/anime.dart';

class AnimeListTile extends StatelessWidget {
  const AnimeListTile({
    super.key,
    required this.anime,
    this.rank,
  });

  final Anime anime;
  final int? rank;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AnimeDetailsScreen.routeName,
          arguments: anime.node.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 16.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                SizedBox(
                  height: 100,
                  width: 150,
                  child: CachedNetworkImage(
                    imageUrl: anime.node.mainPicture.medium,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 20),

                // Anime Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      rank != null
                          ? AnimeRankBadge(rank: rank!)
                          : const SizedBox.shrink(),
                      const SizedBox(height: 10),
                      Text(
                        anime.node.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimeRankBadge extends StatelessWidget {
  const AnimeRankBadge({
    super.key,
    required this.rank,
  });

  final int rank;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.amberAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 3.0,
        ),
        child: Text(
          'Rank $rank',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
