import 'package:ai_news/providers/tag_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/multi_select_checkbox_list.dart';
import '../database/article_model.dart';
import '../database/constant.dart';
import '../models/news.dart';
import '../providers/article_provider.dart';
import '../services/data_services.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late WebViewController _controller;

  bool visible = false;
  late Article article;
  bool loaded = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
      ));
  }

  @override
  void dispose() {
    super.dispose();
    loaded = false;
  }

  void toggleShow() {
    setState(() {
      visible = !visible;
    });
  }

  Future<void> likeArticle(
      Article article, ArticleCategory? articleCategory) async {
    if (article.status == ArticleStatus.like) {
      await Provider.of<ArticleProvider>(context, listen: false)
          .cancelLikeOrDislikeArticle(article);
    } else {
      await Provider.of<ArticleProvider>(context, listen: false)
          .likeArticle(article);
      if (articleCategory != null && articleCategory.categories.isNotEmpty) {
        showTagAdd(OpinionType.like, articleCategory.categories);
      }
    }
    setState(() {});
  }

  List<String> selectedTags = [];

  void showTagAdd(OpinionType opinionType, List<String> options) async {
    selectedTags = [];
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text('标签'),
                content: MultiSelectCheckboxList(
                  options: options,
                  onChange: (List<String> tags) {
                    selectedTags = tags;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (selectedTags.isNotEmpty) {
                        Provider.of<TagProvider>(context, listen: false)
                            .addTags(selectedTags, opinionType);
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text('添加标签'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('取消'),
                  )
                ]));
  }

  Future<void> dislikeArticle(
      Article article, ArticleCategory? articleCategory) async {
    if (article.status == ArticleStatus.dislike) {
      await Provider.of<ArticleProvider>(context, listen: false)
          .cancelLikeOrDislikeArticle(article);
    } else {
      await Provider.of<ArticleProvider>(context, listen: false)
          .dislikeArticle(article);
      if (articleCategory != null && articleCategory.categories.isNotEmpty) {
        showTagAdd(OpinionType.dislike, articleCategory.categories);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ArticleRank articleRank =
        ModalRoute.of(context)!.settings.arguments as ArticleRank;
    if (articleRank.article.value == null) {
      articleRank.article.loadSync();
    }
    article = articleRank.article.value!;
    if (!loaded) {
      loaded = true;
      _controller.loadRequest(Uri.parse(article.url));
    }
    print(article.url);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Hero(
              tag: article.id,
              child: Material(
                  child: Text(
                article.title,
                overflow: TextOverflow.ellipsis,
              ))),
          actions: [
            IconButton(
              onPressed: () async {
                likeArticle(article, article.category);
              },
              icon: Icon(
                Icons.thumb_up,
                color: article.status == ArticleStatus.like
                    ? Colors.green
                    : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () async {
                dislikeArticle(article, article.category);
              },
              icon: Icon(
                Icons.thumb_down,
                color: article.status == ArticleStatus.dislike
                    ? Colors.red
                    : Colors.grey,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            // image

            // description
            const SizedBox(height: 20),

            Text(article.content.description ?? "",
                maxLines: visible ? null : 2,
                overflow:
                    visible ? TextOverflow.visible : TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),

            Expanded(
              child: WebViewWidget(
                controller: _controller,
              ),
            )
          ],
        ));
  }
}
