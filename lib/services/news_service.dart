import 'package:dio/dio.dart';

import '../models/artical-model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticalModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=4f072088e7ac49578470f54d6e0a57f7&category=$category");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<ArticalModel> articleList = [];
      for (var article in articles) {
        ArticalModel articleModel = ArticalModel(
          title: article["title"],
          subtitle: article["description"] ?? "No description available",
          image: article["urlToImage"],
        );
        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      print(e);
      return []; // Return an empty list in case of an error
    }
  }
}
