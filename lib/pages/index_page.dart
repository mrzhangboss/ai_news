import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottom_nav_bar.dart';
import 'hate_page.dart';
import 'list_page.dart';
import 'love_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 1;

  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = [const LovePage(), const ListPage(), const HatePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: onTabChange,
      ),
      body: pages[_selectedIndex],
    );
  }
}
