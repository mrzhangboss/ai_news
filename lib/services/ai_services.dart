import '../models/news.dart';

class AiServices {
  final String token;
  final String robotId;

  const AiServices({required this.token, required this.robotId});

  Future<List<News>> getAiResponse(List<News> latestNews) async {
    for (var i = 0; i < 5; i++) {
      print('--- ');
      print('id：$i ');
      print('标题：${latestNews[i].title} ');
      print('简介：${latestNews[i].description} ');
    }
    return Future(() => []);
  }
}
