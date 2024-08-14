
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../database/article_model.dart';
import '../database/constant.dart';
import '../parsers/base_parser.dart';
import '../parsers/juejin_parser.dart';
import '../parsers/toutiao_parser.dart';
import '../parsers/zhihu_parser.dart';
import 'ai_provider.dart';

class ArticleProvider extends ChangeNotifier {
  final Isar isar;

  ArticleProvider(this.isar);

  Stream<Article?> getArticleStream(int id) {
    return isar.articles.watchObject(id);
  }

  List<Article> lastRecommend = [];

  Future<List<Article>> getArticleByStatus(
      ArticleStatus status, int limit) async {
    List<Article> articles = await isar.articles
        .filter()
        .statusEqualTo(status)
        .sortByUpdateAtDesc()
        .limit(limit)
        .findAll();
    return articles;
  }

  Future<List<Tag>> getTagByType(OpinionType opinionType, int limit) async {
    return await isar.tags
        .filter()
        .opinionEqualTo(opinionType)
        .sortByCreateAtDesc()
        .limit(limit)
        .findAll();
  }

  List<ArticleRank> buildRankByArticles(List<Article> articles) {
    // fake rank
    List<ArticleRank> ranks = [];

    for (var article in articles) {
      ArticleRank rank = ArticleRank();
      rank.article.value = article;
      rank.rank = article.rank;
      rank.hot = article.hot;
      ranks.add(rank);
    }
    return ranks;
  }

  Future<List<ArticleRank>> getArticlesByStatus(ArticleStatus status,
      [int size = 15, int offset = 0]) async {
    return buildRankByArticles(await isar.articles
        .filter()
        .statusEqualTo(status)
        .sortByUpdateAtDesc()
        .offset(offset)
        .limit(size)
        .findAll());
  }

  Future<List<ArticleRank>> getArticle(ArticleType type,
      [int size = 15, int offset = 0]) async {
    var query = isar.articleRanks.where();
    if (type == ArticleType.like) {
      return getArticlesByStatus(ArticleStatus.like, size, offset);
    }
    if (type == ArticleType.dislike) {
      return getArticlesByStatus(ArticleStatus.dislike, size, offset);
    }
    if (type != ArticleType.all) {
      return await query
          .filter()
          .typeEqualTo(type)
          .sortByRank()
          .offset(offset)
          .limit(size)
          .findAll();
    }
    return Future.value([]);
  }

  List<Article> getLastRecommend() {
    return isar.articles.filter().hadTaggedEqualTo(true).sortByUpdateAtDesc().limit(15).findAllSync();
  }

  final String cacheKey = 'aiRecommend';

  Stream<Article> getRecommendArticlesWithStream() async* {
    DateTime? lastUpdate = await getLastCacheTime(cacheKey);
    if (lastUpdate != null &&
        lastUpdate.add(const Duration(seconds: 60)).isAfter(DateTime.now())) {
      print('cache $cacheKey $lastUpdate ');
      for (var x in lastRecommend) {
        yield x;
      }
      return;
    }
    saveLastCacheTime(cacheKey);
    // 获取当前未阅读的文章
    List<Article> unreadArticles =
        await getArticleByStatus(ArticleStatus.unread, 50);
    List<Article> clickedArticles =
        await getArticleByStatus(ArticleStatus.clicked, 10);
    List<Article> dislikeArticles =
        await getArticleByStatus(ArticleStatus.dislike, 5);
    List<Article> likeArticles =
        await getArticleByStatus(ArticleStatus.like, 5);

    List<Tag> normalTag = await getTagByType(OpinionType.neutral, 5);
    List<Tag> likeTag = await getTagByType(OpinionType.like, 10);
    List<Tag> dislikeTag = await getTagByType(OpinionType.dislike, 10);

    yield* AiProvider.getAiRecommendStream(unreadArticles, clickedArticles,
        dislikeArticles, likeArticles, normalTag, likeTag, dislikeTag);
  }

  Future<void> streamComplete(List<Article> articles) async {
    // recommend articles
    if (lastRecommend.isNotEmpty) {
      List<Article?> articles =
          await isar.articles.getAll(lastRecommend.map((e) => e.id).toList());
      await isar.writeTxn(() async {
        articles.forEach((element) async {
          if (element != null) {
            if (element.status == ArticleStatus.unread) {
              element.status = ArticleStatus.read;
              element.updateAt = DateTime.now();
              await isar.articles.put(element);
            }
          }
        });
      });
    }

    // save
    if (articles.isNotEmpty) {
      await isar.writeTxn(() async {
        await isar.articles.putAll(articles);
      });
    }

    // fake rank
    lastRecommend = articles;
    clearLastCacheTime(cacheKey);
  }


  ZhihuParser zhihuParser = ZhihuParser();
  ToutiaoParser toutiaoParser = ToutiaoParser();
  JuejinParser juejinParser = JuejinParser();

  BaseParser getParser(ArticleType type) {
    switch (type) {
      case ArticleType.zhihu:
        return zhihuParser;
      case ArticleType.juejin:
        return juejinParser;
      default:
        return toutiaoParser;
    }
  }

  Future<DateTime?> getLastCacheTime(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt(url);
    return counter != null
        ? DateTime.fromMillisecondsSinceEpoch(counter)
        : null;
  }

  Future<void> saveLastCacheTime(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(url, DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> clearLastCacheTime(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(url);
  }

  Future<void> refreshHotArticles(ArticleType type) async {
    if (type == ArticleType.like || type == ArticleType.dislike) {
      return;
    }
    if (type == ArticleType.all) {
      await refreshHotArticles(ArticleType.zhihu);
      await refreshHotArticles(ArticleType.juejin);
    }
    BaseParser parser = getParser(type);
    DateTime? lastUpdate = await getLastCacheTime(parser.getDownloadUrl());
    if (lastUpdate != null &&
        lastUpdate.add(const Duration(seconds: 20)).isAfter(DateTime.now())) {
      print('cache $type $lastUpdate ');
      return;
    }
    final headers = {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    };
    final response =
        await http.get(Uri.parse(parser.getDownloadUrl()), headers: headers);

    if (parser.isSuccess(response)) {
      await parser.prepare();
      final List<Article> articles = parser.getArticles(response);
      print('save $type ${articles.length}');
      List<Article> aiArticles = [];
      // 保存文章
      await isar.writeTxn(() async {
        for (var item in articles) {
          Article? old =
              await isar.articles.filter().urlEqualTo(item.url).findFirst();
          Article article = old ?? Article();

          article
            ..rank = item.rank
            ..hot = item.hot
            ..title = item.title
            ..url = item.url
            ..type = item.type
            ..content = item.content;
          await isar.articles.put(article);
          ArticleRank? oldRank = await isar.articleRanks
              .filter()
              .rankEqualTo(item.rank)
              .typeEqualTo(item.type)
              .findFirst();
          ArticleRank rank = oldRank ?? ArticleRank();
          rank
            ..rank = item.rank
            ..type = item.type
            ..hot = item.hot
            ..updateAt = DateTime.now();
          rank.article.value = article;
          await isar.articleRanks.put(rank);
          await rank.article.save();
          if (article.category == null) {
            aiArticles.add(article);
          }
        }
      });

      // 保存排行信息
      saveLastCacheTime(parser.getDownloadUrl());
      notifyListeners();
    } else {
      print('end ${response.statusCode}');

      throw Exception(
          'Failed to load articles ${response.statusCode} : ${response.body}');
    }
  }

  Future<void> clickedArticle(Article article, ArticleType type) async {
    article.readTimes++;
    List<ArticleRank> ranks =
        await isar.articleRanks.filter().typeEqualTo(article.type).findAll();
    await isar.writeTxn(() async {
      if (article.status == ArticleStatus.unread ||
          article.status == ArticleStatus.read) {
        article.status = ArticleStatus.clicked;
      }
      await isar.articles.put(article);
      for (var rank in ranks) {
        rank.typeReadTimes++;
        if (type != ArticleType.all &&
            type != ArticleType.like &&
            type != ArticleType.dislike) {
          if (rank.rank < article.rank) {
            if (!rank.article.isLoaded) {
              await rank.article.load();
            }
            Article lowerArticle = rank.article.value!;
            if (lowerArticle.status == ArticleStatus.unread) {
              lowerArticle.status = ArticleStatus.read;
              await isar.articles.put(lowerArticle);
            }
          }
        }
        await isar.articleRanks.put(rank);
      }
    });
    notifyListeners();
  }

  Future<void> likeArticle(Article article) async {
    await isar.writeTxn(() async {
      article.status = ArticleStatus.like;
      article.updateAt = DateTime.now();
      await isar.articles.put(article);
    });
    notifyListeners();
  }

  Future<void> cancelLikeOrDislikeArticle(Article article) async {
    await isar.writeTxn(() async {
      article.status = ArticleStatus.clicked;
      article.updateAt = DateTime.now();
      await isar.articles.put(article);
    });
    notifyListeners();
  }

  Future<void> dislikeArticle(Article article) async {
    await isar.writeTxn(() async {
      article.status = ArticleStatus.dislike;
      article.updateAt = DateTime.now();
      await isar.articles.put(article);
    });
    notifyListeners();
  }

  void saveArticleContent(Article article, String content) async {
    await isar.writeTxn(() async {
      article.updateAt = DateTime.now();
      article.content.content = content;
      await isar.articles.put(article);
    });
  }
}
