import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/news.dart';
import '../services/data_services.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late WebViewController _controller;

  bool visible = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
      ));
  }

  void toggleShow() {
    setState(() {
      visible = !visible;
    });
  }

  void _likeNews(_) {
    final News news = ModalRoute.of(context)!.settings.arguments as News;

    Provider.of<DataServices>(context, listen: false).likeNews(news);
  }

  void _disLikeNews(_) {
    final News news = ModalRoute.of(context)!.settings.arguments as News;
    Provider.of<DataServices>(context, listen: false).dislikeNews(news);
  }

  @override
  Widget build(BuildContext context) {
    final News news = ModalRoute.of(context)!.settings.arguments as News;
    print(news.url);
    _controller.loadRequest(Uri.parse(news.url));

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(news.title),
        ),
        body: Column(
          children: [
            // image

            // description
            const SizedBox(height: 20),

            Text(news.description,
                maxLines: visible ? null : 2,
                overflow:
                    visible ? TextOverflow.visible : TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),

            Expanded(
              child: Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: _disLikeNews,
                        backgroundColor: Colors.red,
                        icon: Icons.thumb_down,
                        label: 'Dislike',
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ],
                  ),
                  startActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: _likeNews,
                        backgroundColor: Colors.green,
                        icon: Icons.thumb_up,
                        label: 'Like',
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ],
                  ),
                  child: WebViewWidget(
                    controller: _controller,
                  )),
            )
          ],
        ));
  }
}
