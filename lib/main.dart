import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news1/services/news_service.dart';
import 'package:news1/views/home_view.dart';

void main() {
  runApp(newsApp());
}

class newsApp extends StatelessWidget {
  const newsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
