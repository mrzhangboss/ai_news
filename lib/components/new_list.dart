import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    await newsService.getNews(
        (x) => Provider.of<DataServices>(context, listen: false).saveNews(x));
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
                    return HotItemTile(
                      news: news[index],
                      index: index,
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: news[index]);
                      },
                    );
                  }))
    ]);
  }
}
