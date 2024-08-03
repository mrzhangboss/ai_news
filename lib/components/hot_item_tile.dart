import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/comment.dart';
import '../models/news.dart';

class HotItemTile extends StatelessWidget {
  final News news;
  final Comment comment;
  final int index;
  final bool isRecommendPage;
  final Function()? onTap;

  const HotItemTile(
      {super.key,
      required this.news,
      required this.index,
      this.onTap,
      required this.comment,
      required this.isRecommendPage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Text(
            '${index + 1}',
            style: TextStyle(
                color: index < 3 ? Colors.red[400] : Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: isRecommendPage &&
                        comment.like != null &&
                        comment.like! < 30
                    ? TextDecoration.lineThrough
                    : null),
          ),
          title: Text(news.title),
          subtitle: Row(
            children: [
              Text(
                news.note ?? "",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              if (comment.isLiked == true)
                const Icon(
                  Icons.thumb_up,
                  color: Colors.green,
                  size: 12,
                ),
              if (comment.category != null)
                Text(comment.category!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold))
            ],
          ),
          trailing: news.imageUrl.isEmpty
              ? null
              : ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.network(
                    news.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  )),
        ),
      ),
    );
  }
}
