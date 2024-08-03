import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

import '../models/ai_model.dart';
import '../models/news.dart';
import 'package:http/http.dart' as http;

class AiServices {
  final String token;
  final String robotId;

  const AiServices({required this.token, required this.robotId});

  Future<void> debug(Object o) async {
    final directory = await getApplicationDocumentsDirectory();
    final logFilePath = '${directory.path}/log.txt';

    // 创建或打开文件
    final file = File(logFilePath);

    // 写入文件
    await file.writeAsString(jsonEncode(o), mode: FileMode.write);
  }

  Future<List<AiModel>> getAiCategoryResponse(List<AiModel> latestNews) async {
    const url = 'https://api.coze.cn/open_api/v2/chat';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Host': 'api.coze.cn',
      'Connection': 'keep-alive',
    };

    List<String> lines = ['#文章分类'];
    for (int i = 0; i < latestNews.length; i++) {
      var item = latestNews[i];
      lines.add('\n\n');
      lines.add('id： $i');
      lines.add('\n\n');
      lines.add('标题：： `${item.title}`');
      lines.add('简介：： `${item.description}`');
    }
    lines.forEach(print);
    final data = {
      // "conversation_id": "1231231",
      "bot_id": robotId,
      "user": "12321123",
      "query": lines.join("\n"),
      "custom_variables": {"categories": "科技、热点、技术、时事"},
      "stream": false,
    };

    print('begin request ${lines.length}');

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['code'] == 0) {
        final messages = responseBody['messages'] as List;
        final content = messages[0]['content'] as String;
        if (content == '对不起，我无法回答这个问题。') {
          return Future(() => latestNews);
        }
        print(content);
        debug(data);
        final res = content.replaceAll('=====', '').trim().split('\n');
        for (int i = 0; i < res.length; i++) {
          var item = res[i];
          var ss = item.split(',');
          if (ss.length == 2) {
            var index = int.parse(ss[0]);
            if (index < latestNews.length) {
              print("${ss[0]} - ${ss[1]}");
              latestNews[int.parse(ss[0])].category = ss[1];
            }

          }

        }
      }
      print(responseBody);
    } else {
      print('Failed to load data');
    }
    return Future(() => latestNews);
  }

  void addText(List<String> lines, String header, List<News> news) {
    if (news.isNotEmpty) {
      List<String> items = [];
      for (News item in news) {
        items.add(item.title);
      }
      String titles = items.join(",");
      lines.add("$header : $titles");
    }
  }

  Future<List<AiModel>> getAiSortResponse(
      List<News> likeNews,
      List<News> dislikeNews,
      List<News> clickedNews,
      List<AiModel> latestNews) async {
    const url = 'https://api.coze.cn/open_api/v2/chat';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Host': 'api.coze.cn',
      'Connection': 'keep-alive',
    };

    List<String> lines = ['#文章筛选排序'];

    addText(lines, "我喜欢的文章有", likeNews);
    addText(lines, "我讨厌的文章有", dislikeNews);
    addText(lines, "我感兴趣的文章有", clickedNews);

    for (int i = 0; i < latestNews.length; i++) {
      var item = latestNews[i];
      lines.add('\n\n');
      lines.add('id： $i');
      lines.add('\n\n');
      lines.add('标题：： `${item.title}`');
      lines.add('分类：： `${item.category}`');
    }
    lines.forEach(print);
    final data = {
      // "conversation_id": "1231231",
      "bot_id": robotId,
      "user": "12321123",
      "query": lines.join("\n"),
      "custom_variables": {"categories": "科技、热点、技术、时事"},
      "stream": false,
    };

    print('begin request ${lines.length}');

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['code'] == 0) {
        final messages = responseBody['messages'] as List;
        final content = messages[0]['content'] as String;
        print(content);
        if (content == '对不起，我无法回答这个问题。') {
          return Future(() => latestNews);
        }
        final res = content.replaceAll('=====', '').trim().split('\n');
        for (int i = 0; i < res.length; i++) {
          var item = res[i];
          var ss = item.split(',');
          if (ss.length == 3) {
            print("${ss[0]} - ${ss[1]}");
            var index = int.parse(ss[0]);
            if (index < latestNews.length) {
              latestNews[index].sort = int.parse(ss[1]);
              latestNews[index].like = int.parse(ss[2]);
            }

          }

        }
      }
      print(responseBody);
    } else {
      print('Failed to load data');
    }
    return Future(() => latestNews);
  }
}
