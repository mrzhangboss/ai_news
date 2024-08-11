import 'package:ai_news/pages/detail_page.dart';
import 'package:ai_news/pages/hate_page.dart';
import 'package:ai_news/pages/love_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'pages/index_page.dart';
import 'pages/list_page.dart';
import 'providers/article_provider.dart';
import 'providers/common_provider.dart';
import 'providers/tag_provider.dart';
import 'services/data_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Isar isar = await DataServices.initDatabase();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TagProvider(isar)),
    ChangeNotifierProvider(create: (context) => ArticleProvider(isar)),
    ChangeNotifierProvider(create: (context) => CommonProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI News',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          // background: Colors.grey.shade300,
          // primary: Colors.grey.shade200,
          // secondary: Colors.white,
          // inversePrimary: Colors.grey.shade700
        ),
      ),
      home: const IndexPage(),
      routes: {
        '/index': (context) => const IndexPage(),
        '/list': (context) => const ListPage(),
        '/detail': (context) => const DetailPage(),
        '/love': (context) => const LovePage(),
        '/hate': (context) => const HatePage(),
      },
    );
  }
}
