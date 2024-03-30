import 'package:floor/floor.dart';
import 'package:news_hub/features/daily_news/data/models/article.dart';

/// Handles database operations for `ArticleModel`.
@dao
abstract class ArticleDao {
  /// Inserts an `ArticleModel` into the database.
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  /// Deletes an `ArticleModel` from the database.
  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  /// Retrieves all `ArticleModel` from the database.
  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getArticles();
}