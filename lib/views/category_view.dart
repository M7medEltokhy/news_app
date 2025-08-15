import 'package:flutter/material.dart';
import 'package:news1/models/category_model.dart';
import 'package:news1/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          category,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [NewsListViewBuilder(category: category)],
        ),
      ),
    );
  }
}
