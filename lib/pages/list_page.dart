import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../components/article_list.dart';
import '../database/constant.dart';
import '../utils/version_utils.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static final List<ArticleType> _articleTypes = [
    // ArticleType.all,

    ArticleType.zhihu,
    ArticleType.zhihuDay,
    ArticleType.juejin,
    ArticleType.weibo,
    ArticleType.three6Ke,
    ArticleType.bilibili,
    ArticleType.baiduRD,
    ArticleType.douyinHot,
    ArticleType.douban,
    ArticleType.huXiu,
    ArticleType.woShiPm,
    ArticleType.toutiao,
    ArticleType.huPu,
  ];

  late List<Tab> myTabs;

  final List<GlobalKey> tabKeys =
      List.generate(_articleTypes.length, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
  }

  Widget buildTabBarView(ArticleType articleType) {
    return ArticleList(
      key: tabKeys[_articleTypes.indexOf(articleType)],
      type: articleType,
    );
  }

  @override
  Widget build(BuildContext context) {
    myTabs = List.generate(_articleTypes.length,
        (index) => Tab(text: articleTypeToString(_articleTypes[index])));
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
          actions: [
            IconButton(
              onPressed: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                String version = packageInfo.version;
                print(version);
                await checkUploadLatestVersion();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: TabBarView(
          children: _articleTypes.map(buildTabBarView).toList(),
        ),
      ),
    );
  }
}
