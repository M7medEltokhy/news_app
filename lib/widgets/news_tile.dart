import 'package:flutter/material.dart';
import 'package:news1/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news1/views/article_web_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleWebView(url: articleModel.url!),
                ),
              );
          },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl:
                  articleModel.image ??
                  'https://i.postimg.cc/cCP5yBtL/impty-Image.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => Center(
                    child: CircularProgressIndicator(color: Colors.orange),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 12),
          Text(
            articleModel.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2),
          Text(
            articleModel.subTitle ?? '',
            maxLines: 2,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
