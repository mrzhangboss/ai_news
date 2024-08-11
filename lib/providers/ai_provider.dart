import 'dart:convert';

import 'package:ai_news/database/constant.dart';
import 'package:flutter/material.dart';

import '../database/article_model.dart';
import 'package:http/http.dart' as http;

import '../utils/encrypt_utils.dart';

const String systemRecommendPrompt = """
# 角色
你是一位高度专业、精细且效率卓越的机器人助理，能够精准地依据用户的喜好来判断其对文章的喜爱程度，并且智能从中挑选出num篇文章给用户。

## 技能
### 文章推荐
1. 用户会告诉你最近点击过的喜欢的、讨厌的文章和来源以及感兴趣的、喜欢的、讨厌的文章主题，同时提供需要推荐的文章标题、来源、文章 ID 列表，每篇文章用 --- 分割
2. 从这批文章中，按照用户喜好的推荐出num篇文章个数，输出文章的id
3. 并总结推荐的这些文章的4个主题，使用逗号,分割

## 输出
以 CSV 列表形式输出，格式如下：
=====
<用户给出的文章 id1>,<用户给出的文章 id2>
<主题1>,<主题2>,<主题3>,,<主题4>
=====

## 限制
- 必须严格遵循给定的格式进行输出，确保毫无偏差。
- 推荐顺序按照给定的顺序来、最近的文章优先
- 推荐的文章必须在用户给出的文章列表中，且不能重复。
- 推荐的文章的标题和内容不能在讨厌的文章中出现，需要参考感兴趣的主题，尽量减少讨厌的主题的问题中推荐，喜欢的主题需要考虑。
- 所有操作仅围绕文章相关内容展开，不涉及其他无关领域。
- 推荐需要合理准确，与用户提供的喜好信息完全相符。
- 输出的 CSV 文件无需表头，仅呈现纯数据。
- 结尾不能有任何多余的评论或总结
- 输出语言为中文
""";

class AiProvider extends ChangeNotifier {
  static void addArticleText(
      String header, List<String> lines, List<Article> articles) {
    if (articles.isNotEmpty) {
      lines.add("$header：");
      for (var article in articles) {
        String type = articleTypeToString(article.type);
        lines.add("- $type : ${article.title}");
      }
    }
  }

  static void addTagText(String header, List<String> lines, List<Tag> tags) {
    if (tags.isNotEmpty) {
      String tagString = tags.map((e) => e.tagName).toList().join(',');
      lines.add("$header：$tagString");
    }
  }

  static Future<List<Article>> getAiRecommend(
      List<Article> articles,
      List<Article> clickArticles,
      List<Article> dislikeArticles,
      List<Article> likeArticles,
      List<Tag> normalTag,
      List<Tag> likeTag,
      List<Tag> dislikeTag,
      [int recommendCount = 15]) async {
    final token = EncryptUtils.decryptString('Gjfwjw xp-ijk2909615kg422if9f1kg0k419hkfh5', 5);
    final url = EncryptUtils.decryptString("kwwsv://gdvkvfrsh.dolbxqfv.frp/frpsdwleoh-prgh/y1/fkdw/frpsohwlrqv", 3);

    final headers = {
      "Authorization": token,
      "Content-Type": "application/json"
    };
    if (articles.length < recommendCount) {
      recommendCount = (articles.length / 2).floor();
    }

    String system =
        systemRecommendPrompt.replaceAll("num", recommendCount.toString());
    print(system);

    List<String> lines = [];
    addArticleText("我点击的文章有", lines, clickArticles);
    addArticleText("我喜欢的文章有", lines, likeArticles);
    addArticleText("我讨厌的文章有", lines, dislikeArticles);
    addTagText("我感兴趣的主题有", lines, normalTag);
    addTagText("我喜欢的主题有", lines, likeTag);
    addTagText("我讨厌的主题有", lines, dislikeTag);

    lines.add("下面是需要推荐的文章:");
    for (int i = 0; i < articles.length; i++) {
      var article = articles[i];
      lines.add("---");
      String type = articleTypeToString(article.type);
      lines.add("- id: $i");
      lines.add("- 标题 : ${article.title}");
      lines.add("- 来源:$type");
      if (i == articles.length - 1) {
        lines.add("---");
      }
    }

    final data = {
      "model": "qwen-long",
      "messages": [
        {"role": "system", "content": system},
        {"role": "user", "content": lines.join('\n')}
      ]
    };
    for (var x in lines) {
      print(x);
    }
    final start = DateTime.now().millisecondsSinceEpoch;
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );
    final end = DateTime.now().millisecondsSinceEpoch;
    List<Article> recommendArticles = [];
    if (response.statusCode == 200) {
      print("Response: ${(end - start) / 1000.0} seconds");
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      print(json);
      if (json['choices'] != null && json['choices'].length > 0) {
        var content = json['choices'][0]['message']['content'];
        final res = content.replaceAll('=====', '').trim().split('\n');
        for (int i = 0; i < res.length; i++) {
          var item = res[i];
          final ss = item.split(',');
          if (ss.length == recommendCount && i + 1 < res.length) {
            print("recommend id $item");
            print("tag id ${ss[i + 1]}");
            for (int j = 0; j < recommendCount; j++) {
              final recommendId = ss[j];
              var index;
              try {
                index = int.parse(recommendId);
                if (index < articles.length) {
                  var article = articles[index];
                  ArticleCategory articleCategory = ArticleCategory();
                  articleCategory.categories.addAll(res[i + 1].split(','));
                  article.category = articleCategory;
                  article.hadTagged = true;
                  recommendArticles.add(article);
                }
              } catch (e) {
                print("error $item $e");
                continue;
              }
            }
          }
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    return recommendArticles;
  }
}
