import 'package:flutter/material.dart';

class MyTag extends StatelessWidget {
  final String tag;
  final bool isSelected;

  const MyTag({super.key, required this.tag, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(tag.isEmpty ? "全部" : tag,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black, fontSize: 12)),
    );
  }
}
