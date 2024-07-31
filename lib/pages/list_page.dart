import 'package:ai_news/components/hot_item_tile.dart';
import 'package:ai_news/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/new_list.dart';
import '../models/constant.dart';
import '../models/news.dart';
import '../services/ai_services.dart';
import '../services/new_services.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: '知乎'),
    const Tab(text: '头条'),
    const Tab(text: '掘金'),
  ];

  final List<NewsType> _newsTypes = [
    NewsType.zhihu,
    NewsType.toutiao,
    NewsType.juejin,
  ];

  @override
  void initState() {
    super.initState();
  }



  Widget buildTabBarView(NewsType newsType) {
    return NewList(newsType: newsType);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: TabBar(
            tabs: myTabs,
            isScrollable: true,
            labelColor: Colors.grey[300],
          ),
        ),
        body: TabBarView(
          children: _newsTypes.map(buildTabBarView).toList(),
        ),
      ),
    );
  }
}
