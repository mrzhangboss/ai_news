import 'package:ai_news/components/hot_item_tile.dart';
import 'package:flutter/material.dart';

import '../models/news.dart';
import '../services/new_services.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<News> _news = [];

  NewsService _newsService = NewsService();

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  void _fetchNews() async {
    var news = await _newsService.getNews();
    setState(() {
      _news = news;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.newspaper,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text("AI News",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Expanded(
            child: _news.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blue,
                  ))
                : ListView.builder(
                    itemCount: _news.length,
                    itemBuilder: (context, index) {
                      return HotItemTile(
                        news: _news[index],
                        index: index,
                        onTap: () {
                          Navigator.pushNamed(context, '/detail',
                              arguments: _news[index]);
                        },
                      );
                    }))
      ]),
    );
  }
}
