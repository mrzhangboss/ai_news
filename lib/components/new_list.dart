import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/constant.dart';
import '../models/news.dart';
import '../services/data_services.dart';
import '../services/new_services.dart';
import 'hot_item_tile.dart';

class NewList extends StatefulWidget {
  final NewsType newsType;

  const NewList({super.key, required this.newsType});

  @override
  State<NewList> createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  late NewsService newsService;

  @override
  void initState() {
    super.initState();
    newsService = NewsService(newsType: widget.newsType);
    _fetchLatestNews();
  }

  void _fetchLatestNews() async {
    var provider = Provider.of<DataServices>(context, listen: false);

    if (provider.isNeedUpdate(widget.newsType)) {
      List<News> news = await newsService.getNews();
      provider.saveNews(news);
    }

  }

  void _likeNews(News news) async {
    Provider.of<DataServices>(context, listen: false).likeNews(news);
  }

  void _disLikeNews(News news) async {
    Provider.of<DataServices>(context, listen: false).dislikeNews(news);
  }

  void _readLikeNews(News news) async {
    Provider.of<DataServices>(context, listen: false).readNews(news);
  }

  bool _isShowNews(News news) {
    return Provider.of<DataServices>(context, listen: false).isShow(news);
  }

  bool _isLikedNews(News news) {
    return Provider.of<DataServices>(context, listen: false).isLiked(news);
  }

  @override
  Widget build(BuildContext context) {
    List<News> news = Provider.of<DataServices>(context, listen: true)
        .getCategoryNews(widget.newsType);
    print('news size ${news.length}');
    return Column(children: [
      Expanded(
          child: news.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    News n = news[index];
                    return _isShowNews(n)
                        ? Container()
                        : HotItemTile(
                            isLiked: _isLikedNews(n),
                            news: n,
                            index: index,
                            onTap: () {
                              _readLikeNews(n);
                              Navigator.pushNamed(context, '/detail',
                                  arguments: n);
                            },
                            onDeleted: (_) => _disLikeNews(n),
                            onLiked: (_) => _likeNews(n),
                          );
                  }))
    ]);
  }
}
