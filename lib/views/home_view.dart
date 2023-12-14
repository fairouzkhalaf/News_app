import 'package:flutter/material.dart';

import '../widgets/category_listview.dart';
import '../widgets/new_listview_builder.dart';

// ignore: camel_case_types
class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

// ignore: camel_case_types
class _Home_viewState extends State<Home_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "Cloud",
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoryListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              NewsListViewBuilder(
                category: "general",
              ),
            ],
          ),
        ));
  }
}
