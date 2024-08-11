import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../database/article_model.dart';

class DataServices {
  static Future<Isar> initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    print('db ${dir.path}');
    return await Isar.open(
      [
        ArticleSchema,
        ArticleRankSchema,
        TagSchema,
      ],
      directory: dir.path,
    );
  }
}
