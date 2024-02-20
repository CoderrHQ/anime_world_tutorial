import 'package:flutter/material.dart';

import '../api/get_anime_by_ranking_type_api.dart';
import '/core/screens/error_screen.dart';
import '/core/widgets/loader.dart';
import '/widgets/ranked_anime_list_view.dart';

class ViewAllAnimesScreen extends StatefulWidget {
  const ViewAllAnimesScreen({
    super.key,
    required this.rankingType,
    required this.label,
  });

  final String rankingType;
  final String label;

  static const routeName = '/view-all-animes';

  @override
  State<ViewAllAnimesScreen> createState() => _ViewAllAnimesScreenState();
}

class _ViewAllAnimesScreenState extends State<ViewAllAnimesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeByRankingTypeApi(
        rankingType: widget.rankingType,
        limit: 500,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.data != null) {
          final animes = snapshot.data!;

          return RankedAnimeListView(
            animes: animes,
            label: widget.label,
          );
        }

        return ErrorScreen(
          error: snapshot.error.toString(),
        );
      },
    );
  }
}
