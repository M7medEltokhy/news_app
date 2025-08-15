import 'package:dio/dio.dart';
import 'package:news1/models/article_model.dart';
import 'package:news1/widgets/news_tile.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?category=$category&apiKey=44550877090046a69d0722b972e72019',
      );
      Map<String, dynamic> jsonData = response.data;
      // List<Map<String,dynamic>>
      List<dynamic> articles = jsonData['articles'];
      // print(jsonData['articles']);

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
