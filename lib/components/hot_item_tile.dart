import 'package:flutter/material.dart';

import '../models/news.dart';

class HotItemTile extends StatelessWidget {
  final News news;
  final int index;
  final Function()? onTap;

  const HotItemTile({super.key, required this.news, required this.index, this.onTap});

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
                color: Colors.red[400],
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          title: Text(news.title),
          subtitle: Text(
            news.hot,
            style: const TextStyle(
              color: Colors.grey,
            ),
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
    ;
  }
}
