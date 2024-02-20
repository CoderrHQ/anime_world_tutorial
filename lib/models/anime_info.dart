import 'package:flutter/foundation.dart' show immutable;

import '/models/anime.dart';

@immutable
class AnimeInfo {
  final Iterable<Anime> animes;

  const AnimeInfo({
    required this.animes,
  });

  factory AnimeInfo.fromJson(Map<String, dynamic> json) {
    List<dynamic> animeRankingList = json['data'];
    List<Anime> animeRankingItems = animeRankingList
        .map(
          (item) => Anime.fromJson(item),
        )
        .toList();

    return AnimeInfo(
      animes: animeRankingItems,
    );
  }
}

@immutable
class Ranking {
  final int rank;

  const Ranking({
    required this.rank,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      rank: json['rank'],
    );
  }
}
