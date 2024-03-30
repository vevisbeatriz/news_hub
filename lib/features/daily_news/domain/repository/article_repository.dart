import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/core/resources/data_state.dart';

/// `ArticleRepository` is an abstract class that defines the contract for a repository that fetches news articles.
abstract class ArticleRepository {
  /// API methods to fetch news articles.
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  /// Database methods to fetch news articles.
  Future<List<ArticleEntity>> getSavedArticles();

  /// Saves an article to a local database.
  Future<void> saveArticle(ArticleEntity article);

  /// Deletes an article from a local database.
  Future<void> deleteArticle(ArticleEntity article);
}
