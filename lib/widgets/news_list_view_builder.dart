import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news1/models/article_model.dart';
import 'package:news1/models/category_model.dart';
import 'package:news1/services/news_service.dart';
import 'package:news1/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  NewsListViewBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // List<ArticleModel> articles = [];
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'oops there was an error ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orange[800],
                    ),
                  ),
                  Text(
                    'try later',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orange[800],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(color: Colors.orange),
            ),
          );
        }
      },
    );
    // return isLoading
    //     ? SliverFillRemaining(
    //       hasScrollBody: false,
    //       child: Center(child: CircularProgressIndicator(color: Colors.orange)),
    //     )
    //     : articles.isNotEmpty
    //     ? NewsListView(articles: articles)
    //     : SliverFillRemaining(
    //       hasScrollBody: false,
    //       child: Center(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text(
    //               'oops there was an error ',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 30,
    //                 color: Colors.orange[800],
    //               ),
    //             ),
    //             Text(
    //               'try later',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 30,
    //                 color: Colors.orange[800],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
  }
}
