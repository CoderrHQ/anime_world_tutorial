import 'package:flutter/material.dart';

import '../api/get_seasonal_animes_api.dart';
import '/core/screens/error_screen.dart';
import '/core/widgets/loader.dart';
import '../views/anime_list_view.dart';

class ViewAllSeasonalAnimesScreen extends StatefulWidget {
  const ViewAllSeasonalAnimesScreen({
    super.key,
    required this.label,
  });

  final String label;

  static const routeName = '/view-all-seasonal-animes';

  @override
  State<ViewAllSeasonalAnimesScreen> createState() =>
      _ViewAllSeasonalAnimesScreenState();
}

class _ViewAllSeasonalAnimesScreenState
    extends State<ViewAllSeasonalAnimesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSeasonalAnimesApi(
        limit: 500,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.data != null) {
          final animes = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Top animes'),
            ),
            body: AnimeListView(animes: animes),
          );
        }

        return ErrorScreen(
          error: snapshot.error.toString(),
        );
      },
    );
  }
}
