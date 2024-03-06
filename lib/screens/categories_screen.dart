import 'package:anime_world_tutorial/views/anime_grid_view.dart';
import 'package:flutter/material.dart';

import '/models/anime_category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _animeTabs = animeCategories
      .map((animeCategory) => Tab(text: animeCategory.title))
      .toList();

  final _screens = animeCategories
      .map(
        (animeCategory) => AnimeGridView(
          category: animeCategory,
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Anime Categories'),
          bottom: TabBar(
            isScrollable: true,
            tabs: _animeTabs,
            indicatorSize: TabBarIndicatorSize.label,
            tabAlignment: TabAlignment.start,
            indicatorWeight: 3,
            indicatorColor: Colors.red,
            labelColor: Colors.red,
          ),
        ),
        body: TabBarView(
          children: _screens,
        ),
      ),
    );
  }
}
