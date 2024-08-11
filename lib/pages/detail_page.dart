import 'package:ai_news/providers/tag_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
      ..setUserAgent(
          "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36");
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

  final Map<ArticleType, List<String>> forbidUrls = {
    ArticleType.zhihu: ['https://www.zhihu.com/oia/'],
    ArticleType.juejin: ['https://z.juejin.cn'],
    ArticleType.three6Ke: ['https://wzyd.statchannel.top/a'],
    ArticleType.bilibili: [' https://dl.hdslb.com/mobile'],
    ArticleType.douban: ['https://www.douban.com/doubanapp', 'http://andariel.douban.com/d'],
    ArticleType.huXiu: ['http://pkg.huxiucdn.com', 'https://m.huxiu.com/download'],
    ArticleType.huPu: ['https://games.mobileapi.hupu.com'],
  };

  final Map<ArticleType, List<String>> supportApp = {
    ArticleType.bilibili: ['bilibili:'],

  };


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
      _controller.setNavigationDelegate(NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
        print('begin ${article.type} ${request.url}');
        // 白名单
        if (supportApp.containsKey(article.type)) {
          for (var url in supportApp[article.type]!) {
            if (request.url.startsWith(url)) {
              if (!await launchUrl(Uri.parse(request.url))) {
                print('Could not launch ${request.url}');
              }
            }
          }
        }

        // 黑名单
        if (request.url.startsWith('https:') || request.url.startsWith('http:')) {
          if (forbidUrls.containsKey(article.type)) {
            for (var url in forbidUrls[article.type]!) {
              if (request.url.startsWith(url)) {
                return NavigationDecision.prevent;
              }
            }
          }
          return NavigationDecision.navigate;
        }
        return NavigationDecision.prevent;
      }));
      if (article.type == ArticleType.bilibili) {
        // _controller.setJavaScriptMode(JavaScriptMode.disabled);
      } else {
        _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
      }

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
