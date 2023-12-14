import 'package:flutter/material.dart';
import 'package:news_app/widgets/new_listview_builder.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(
            category: widget.category,
          ),
        ],
      ),
    );
  }
}
