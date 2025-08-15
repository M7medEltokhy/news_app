import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news1/models/article_model.dart';
import 'package:news1/services/news_service.dart';
import 'package:news1/widgets/category_card.dart';
import 'package:news1/widgets/category_list_view.dart';
import 'package:news1/widgets/news_list_view.dart';
import 'package:news1/widgets/news_list_view_builder.dart';
import 'package:news1/widgets/news_tile.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            NewsListViewBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}
