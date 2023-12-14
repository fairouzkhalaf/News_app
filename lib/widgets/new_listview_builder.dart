import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical-model.dart';

import '../services/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String category;
  const NewsListViewBuilder({
    super.key,
    required this.category,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    future = NewsService(Dio()).getNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
        future: future,
        builder: (context, Snapshot) {
          if (Snapshot.hasData) {
            return NewsListView(
              articles: Snapshot.data!,
            );
          } else if (Snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text("Oops There is Error ,Try Again"),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
                child: Center(
                    child: Padding(
              padding: EdgeInsets.symmetric(vertical: 200),
              child: CircularProgressIndicator(),
            )));
          }
        });
    // return isloading
    //     ? const SliverToBoxAdapter(
    //         child: Center(
    //             child: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 200),
    //         child: CircularProgressIndicator(),
    //       )))
    //     : articles.isNotEmpty
    //         ? NewsListView(
    //             articles: articles,
    //           )
    //         : const SliverToBoxAdapter(
    //             child: Center(
    //               child: Text("Oops There is Error ,Try Again"),
    //             ),
    //           );
  }
}
