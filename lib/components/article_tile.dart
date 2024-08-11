import 'package:ai_news/database/article_model.dart';
import 'package:ai_news/providers/article_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/constant.dart';

class ArticleTile extends _ArticleTile {
  const ArticleTile(
      {super.key,
      required super.article,
      required super.isAll,
      super.onTap,
      required super.currentSearch,
      required super.showDislike});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<ArticleProvider>(context, listen: false)
            .getArticleStream(article.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _ArticleTile(
              article: snapshot.data!,
              isAll: isAll,
              onTap: onTap,
              currentSearch: currentSearch,
              showDislike: showDislike,
            );
          } else {
            return _ArticleTile(
              article: article,
              showDislike: showDislike,
              isAll: isAll,
              onTap: onTap,
              currentSearch: currentSearch,
            );
          }
        });
  }
}

class _ArticleTile extends StatelessWidget {
  final Article article;
  final bool isAll;
  final bool showDislike;
  final String currentSearch;
  final Function()? onTap;

  const _ArticleTile(
      {super.key,
      required this.article,
      required this.isAll,
      this.onTap,
      required this.currentSearch,
      required this.showDislike});

  @override
  Widget build(BuildContext context) {
    return (!showDislike && article.status == ArticleStatus.dislike) ||
            (currentSearch.isNotEmpty && !article.title.contains(currentSearch))
        ? Container(
            key: Key('${article.id}'),
          )
        : InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Text(
                  isAll ? articleTypeToString(article.type) : "${article.rank}",
                  style: TextStyle(
                      color: article.rank < 3 ? Colors.red[400] : Colors.grey,
                      fontSize: isAll ? 12 : 24,
                      fontWeight: FontWeight.bold),
                ),
                title: Hero(
                    tag: article.id,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          article.title,
                          overflow: TextOverflow.ellipsis,
                        ))),
                subtitle: Row(
                  children: [
                    Text(
                      article.hot ?? "",
                      style: TextStyle(
                        color: article.status == ArticleStatus.unread
                            ? Colors.green.shade200
                            : Colors.grey.shade400,
                      ),
                    ),
                    if (article.status == ArticleStatus.like)
                      const Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                        size: 12,
                      ),
                    if (isAll)
                      Text(
                        articleTypeToString(article.type),
                        style: const TextStyle(color: Colors.grey),
                      ),
                  ],
                ),
                trailing: article.content.backgroundIcon == null
                    ? null
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(
                          article.content.backgroundIcon!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill,
                        )),
              ),
            ),
          );
  }
}
