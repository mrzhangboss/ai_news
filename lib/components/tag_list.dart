import 'package:ai_news/providers/tag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/article_model.dart';
import '../database/constant.dart';
import 'my_tag.dart';

class TagList extends StatefulWidget {
  const TagList({super.key});

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final TextEditingController _tagNameController = TextEditingController();

  void changeCurrentTag(String tagName) {
    Provider.of<TagProvider>(context, listen: false).currentTag = tagName;
  }

  void addNewTag() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("添加标签"),
              content: TextField(
                controller: _tagNameController,
                onSubmitted: (value) {
                  Provider.of<TagProvider>(context, listen: false)
                      .addTag(value);
                  _tagNameController.clear();
                  Navigator.pop(context);
                },
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("取消")),
                TextButton(
                  onPressed: () {
                    Provider.of<TagProvider>(context, listen: false)
                        .addTag(_tagNameController.text);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "添加",
                    style: TextStyle(color: Colors.green),
                  ),
                )
              ]);
        });
  }

  void deleteTag(String tagName) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("删除标签"),
              content: Text("确定删除标签 $tagName 吗？"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("取消")),
                TextButton(
                  onPressed: () {
                    Provider.of<TagProvider>(context, listen: false)
                        .deleteTag(tagName);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "删除",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TagProvider>(context, listen: true);
    List<Tag> tags = provider.getAllTags();
    return SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            itemCount: tags.length,
            itemBuilder: (context, index) {
              var tag = tags[index];
              Color bg;
              Color wordColor = Colors.grey.shade300;
              if (tag.tagName.isEmpty) {
                bg = Colors.blue.shade400;
              } else if (tag.opinion == OpinionType.like) {
                bg = Colors.green.shade400;
              } else {
                bg = Colors.red.shade200;
              }
              return InkWell(
                onLongPress: () {
                  tag.tagName.isEmpty ? addNewTag() : deleteTag(tag.tagName);
                },
                child: MyTag(
                  tag: tag.tagName,
                  color: wordColor ,
                  boxColor: bg ,
                ),
              );
            }));
  }
}
