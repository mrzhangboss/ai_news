import 'package:flutter/material.dart';

import '../components/article_list.dart';
import '../database/constant.dart';

class HatePage extends StatelessWidget {
  const HatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // header
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: Center(
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.thumb_down,
                      size: 20,
                    ),
                    Text(
                      "不喜欢列表",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),


          // body
          Expanded(child: ArticleList(type: ArticleType.dislike, showDislike: true))
        ],
      ),
    );
  }
}
