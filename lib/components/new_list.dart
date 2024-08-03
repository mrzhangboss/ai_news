import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/comment.dart';
import '../models/constant.dart';
import '../models/news.dart';
import '../services/data_services.dart';
import '../services/new_services.dart';
import 'hot_item_tile.dart';
import 'my_tag.dart';

class NewList extends StatefulWidget {
  final NewsType newsType;

  const NewList({super.key, required this.newsType});

  @override
  State<NewList> createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  late NewsService newsService;
  bool isLoading = false;
  String currentTag = "";

  @override
  void initState() {
    super.initState();
    newsService = NewsService(newsType: widget.newsType);
    _fetchLatestNews(false);
  }

  Future<void> _fetchLatestNews([bool force = true]) async {
    if (isLoading) return;
    isLoading = true;
    var provider = Provider.of<DataServices>(context, listen: false);

    if (force && widget.newsType == NewsType.recommend) {
      await provider.generateRecommendNews();
    } else if (force || provider.isNeedUpdate(widget.newsType)) {
      List<News> news = await newsService.getNews();
      provider.saveNews(news);
    }
    setState(() {
      isLoading = false;
    });
  }

  void _clickNews(News news) async {
    Provider.of<DataServices>(context, listen: false).clickNews(news);
  }

  bool _isShowNews(News news) {
    return Provider.of<DataServices>(context, listen: false).isShow(news);
  }

  @override
  Widget build(BuildContext context) {
    DataServices provider = Provider.of<DataServices>(context, listen: true);
    List<News> news = provider .getCategoryNews(widget.newsType);

    print('news size ${news.length}');
    List<String> tags = provider.tags;
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8.0),
                  itemCount: tags.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          currentTag = tags[index];
                        });
                      },
                      child: MyTag(
                          tag: tags[index],
                          isSelected: currentTag == tags[index]),
                    ));
                  })),
          Expanded(
              child: news.isEmpty
                  ? const Center(child: Text("暂无数据"))
                  : RefreshIndicator(
                      onRefresh: _fetchLatestNews,
                      child: ListView.builder(
                          itemCount: news.length,
                          itemBuilder: (context, index) {
                            News n = news[index];
                            Comment comment = Provider.of<DataServices>(context,
                                    listen: false)
                                .getComment(n);

                            return _isShowNews(n) ||
                                    (currentTag.isNotEmpty &&
                                        comment.category != currentTag)
                                ? Container()
                                : HotItemTile(
                                    isRecommendPage:
                                        widget.newsType == NewsType.recommend,
                                    news: n,
                                    comment: comment,
                                    index: index,
                                    onTap: () {
                                      _clickNews(n);
                                      Navigator.pushNamed(context, '/detail',
                                          arguments: n);
                                    },
                                  );
                          }),
                    ))
        ]),
      ),
    );
  }
}
