import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/news.dart';

class HotItemTile extends StatelessWidget {
  final News news;
  final int index;
  final bool isLiked;
  final Function()? onTap;
  final Function(BuildContext)? onDeleted;
  final Function(BuildContext)? onLiked;

  const HotItemTile(
      {super.key,
      required this.news,
      required this.index,
      this.onTap,
      this.onDeleted,
      this.onLiked,
      required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onDeleted,
            backgroundColor: Colors.red,
            icon: Icons.thumb_down,
            label: 'Dislike',
            borderRadius: BorderRadius.circular(8.0),
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onLiked,
            backgroundColor: Colors.green,
            icon: Icons.thumb_up,
            label: 'Like',
            borderRadius: BorderRadius.circular(8.0),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Text(
              '${index + 1}',
              style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
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
                if (isLiked)
                  const Icon(
                    Icons.thumb_up,
                    color: Colors.green,
                    size: 12,
                  )
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
      ),
    );
    ;
  }
}
