import 'package:ai_news/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'model_adapters/comment_adapter.dart';
import 'model_adapters/news_adapter.dart';
import 'pages/list_page.dart';
import 'services/data_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NewsAdapter());
  Hive.registerAdapter(CommentAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataServices(),
      child: MaterialApp(
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
      ),
    );
  }
}
