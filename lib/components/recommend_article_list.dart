import 'package:ai_news/database/article_model.dart';
import 'package:ai_news/providers/common_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/constant.dart';
import '../providers/article_provider.dart';
import '../providers/tag_provider.dart';
import 'article_tile.dart';
import 'search_input.dart';
import 'tag_list.dart';

class RecommendArticleList extends StatefulWidget {
  final ArticleType type;
  final bool showDislike;

  const RecommendArticleList({super.key, required this.type, this.showDislike = false});

  @override
  State<RecommendArticleList> createState() => _RecommendArticleListState();
}

class _RecommendArticleListState extends State<RecommendArticleList> {
  final int _size = 15; //加载的数量
  bool isLoading = false; //是否正在加载数据
  bool isOver = false;
  bool isReload = false;
  int _offset = 0; // 当前offset
  final ScrollController _scrollController = ScrollController();
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ArticleProvider>(context, listen: false);
    articles = provider.getLastRecommend();
    provider.refreshHotArticles(widget.type);
    _fetchArticles(provider);
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        await _getMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _reload() {
    if (context.mounted) {
      setState(() {

      });
    }

  }

  Future<void> _fetchArticles(ArticleProvider provider) async {
    provider.getRecommendArticlesWithStream().listen((event) {
      if (!isReload) {
        articles.clear();
        isReload = true;
      }
      isLoading = true;
      articles.add(event);
      _reload();
    }).onDone(() async {
      isLoading = false;
      await provider.streamComplete(articles.skip(_offset).toList());
      _offset = articles.length;
      _reload();
    });
  }

  Widget _getEmptyWidget() {
    return widget.type != ArticleType.like && widget.type != ArticleType.dislike
        ? const Center(child: CircularProgressIndicator())
        : const Center(
            child: Text(
            '暂无文章',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ));
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ArticleProvider>(context, listen: false);
    final String currentSearch =
        Provider.of<CommonProvider>(context, listen: true).currentSearch;
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          const SearchInput(),
          if (widget.type == ArticleType.all) const TagList(),
          Expanded(
              child: articles.isEmpty
                  ? _getEmptyWidget()
                  : RefreshIndicator(
                      onRefresh: () async {
                        model.refreshHotArticles(widget.type);
                      },
                      child: ListView.builder(
                          itemCount: articles.length + 1,
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            if (index == articles.length) {
                              return _getMoreWidget();
                            }
                            final article = articles[index];

                            return ArticleTile(
                              article: article,
                              key: Key('${article.id}'),
                              showDislike: widget.showDislike,
                              currentSearch: currentSearch,
                              isAll: widget.type == ArticleType.all,
                              onTap: () {
                                model.clickedArticle(article, widget.type);
                                Navigator.pushNamed(context, '/detail',
                                    arguments: articles[index]);
                              },
                            );
                          }),
                    ))
        ]),
      ),
    );
  }

  Widget _getMoreWidget() {
    return isOver
        ? Container()
        : InkWell(
            onTap: () => _getMore(),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '加载中...',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    CircularProgressIndicator(
                      strokeWidth: 1.0,
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Future _getMore() async {
    if (!isLoading && !isOver) {
      isLoading = true;
      _offset += _size;
      await _fetchArticles(
          Provider.of<ArticleProvider>(context, listen: false));
    }
  }
}
