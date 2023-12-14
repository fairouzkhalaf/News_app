import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });
  final List<CategoryModel> categories = const [
    CategoryModel(image: "assets/Business.jpeg", categoryNme: "Business"),
    CategoryModel(
        image: "assets/entertainment.jpeg", categoryNme: "Entertainment"),
    CategoryModel(image: "assets/health.jpeg", categoryNme: "Health"),
    CategoryModel(image: "assets/science.jpeg", categoryNme: "Science"),
    CategoryModel(image: "assets/sports.jpeg", categoryNme: "Sports"),
    CategoryModel(image: "assets/technology.jpeg", categoryNme: "Technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, i) {
            return CategoryCard(category: categories[i]);
          }),
    );
  }
}
