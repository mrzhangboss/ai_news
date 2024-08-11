import 'package:ai_news/database/article_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/constant.dart';
import '../providers/article_provider.dart';
import '../providers/tag_provider.dart';
import 'article_tile.dart';
import 'tag_list.dart';

class ArticleList extends StatefulWidget {
  final ArticleType type;
  final bool showDislike;

  const ArticleList({super.key, required this.type, this.showDislike = false});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  final int _size = 15; //加载的数量
  bool isLoading = false; //是否正在加载数据
  bool isOver = false;
  int _offset = 0; // 当前offset
  final ScrollController _scrollController = ScrollController();
  List<ArticleRank> articles = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ArticleProvider>(context, listen: false);
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

  Future<void> _fetchArticles(ArticleProvider provider) async {
    List<ArticleRank> ranks =
        await provider.getArticle(widget.type, _size, _offset);
    print('fetch ${widget.type} ${ranks.length} $_offset $_size');

    if (ranks.isEmpty) {
      isOver = true;
    } else {
      if (ranks.length < _size) {
        isOver = true;
      }
      articles.addAll(ranks);
    }
    if (context.mounted) {
      setState(() {
        isLoading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final tagProvider = Provider.of<TagProvider>(context, listen: true);
    final model = Provider.of<ArticleProvider>(context, listen: false);
    final String currentTag = tagProvider.currentTag;
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          if (widget.type == ArticleType.all) const TagList(),
          Expanded(
              child: articles.isEmpty
                  ? const Center(child: CircularProgressIndicator())
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
                            if (articles[index].article.value == null) {
                              articles[index].article.loadSync();
                            }
                            final article = articles[index].article.value!;

                            return ArticleTile(
                              article: article,
                              key: Key('${article.id}'),
                              showDislike: widget.showDislike,
                              currentTag: currentTag,
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
        : const Center(
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
