import 'package:flutter/material.dart';
import 'package:news1/models/category_model.dart';
import 'package:news1/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});
  final List<CategoryModel> categories = [
    CategoryModel(categoryName: 'Business', image: 'assets/business.jpg'),
    CategoryModel(categoryName: 'Health', image: 'assets/health.png'),
    CategoryModel(categoryName: 'Sports', image: 'assets/sports.jpg'),
    CategoryModel(categoryName: 'Technology', image: 'assets/technology.jpeg'),
    CategoryModel(categoryName: 'Science', image: 'assets/science.png'),
    CategoryModel(
      categoryName: 'Entertainment',
      image: 'assets/entertainment.png',
    ),
    CategoryModel(categoryName: 'General', image: 'assets/general.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
