import 'package:flutter/material.dart';

class MyTag extends StatelessWidget {
  final String tag;
  final Color color;
  final Color boxColor;

  const MyTag({super.key, required this.tag, required this.color, required this.boxColor, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(tag.isEmpty ? "+" : tag,
            style: TextStyle(
                color: color, fontSize: 12)),
      ),
    );
  }
}
