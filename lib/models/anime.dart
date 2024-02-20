import 'package:flutter/foundation.dart' show immutable;

import '/models/anime_info.dart';
import '/models/anime_node.dart';

@immutable
class Anime {
  final AnimeNode node;
  final Ranking? ranking;

  const Anime({
    required this.node,
    this.ranking,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      node: AnimeNode.fromJson(json['node']),
      ranking:
          json['ranking'] != null ? Ranking.fromJson(json['ranking']) : null,
    );
  }
}
