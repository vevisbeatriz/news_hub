import 'package:floor/floor.dart';
import 'package:news_hub/features/daily_news/data/models/article.dart';
import 'package:news_hub/features/daily_news/data/data_sources/local/DAO/article_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

/// This is a part directive in Dart. It's used to split a library into multiple Dart files.
/// You should not manually modify this file as it is auto-generated and your changes will be overwritten the next time code generation runs.
part 'app_database.g.dart';

/// `AppDatabase` is an abstract class that extends `FloorDatabase`.
/// It contains a getter for `ArticleDao` which handles database operations for `ArticleModel`.
@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}