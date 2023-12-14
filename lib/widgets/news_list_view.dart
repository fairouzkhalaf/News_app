import 'package:flutter/material.dart';
import 'package:news_app/models/artical-model.dart';

import 'package:news_app/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticalModel> articles;
  const NewsListView({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: articles.length,
            (context, i) {
      return NewsTile(
        articalModel: articles[i],
      );
    }));
  }
}
