import 'package:ai_news/pages/detail_page.dart';
import 'package:flutter/material.dart';

import 'pages/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI News',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
            background: Colors.grey.shade300,
            primary: Colors.grey.shade200,
            secondary: Colors.white,
            inversePrimary: Colors.grey.shade700),
      ),
      home: ListPage(),
      routes: {
        '/list': (context) => ListPage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}
