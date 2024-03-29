import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/core/resources/data_state.dart';

/// `ArticleRepository` is an abstract class that defines the contract for a repository that fetches news articles.
/// It has a single method `getNewsArticles` which is expected to be implemented by its subclasses.
abstract class ArticleRepository {
  /// API methods to fetch news articles.
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  /// Database methods to fetch news articles.
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> deleteArticle(ArticleEntity article);
}
