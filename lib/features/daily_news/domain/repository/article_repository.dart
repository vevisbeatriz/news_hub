import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/core/resources/data_state.dart';

/// `ArticleRepository` is an abstract class that defines the contract for a repository that fetches news articles.
/// It has a single method `getNewsArticles` which is expected to be implemented by its subclasses.
abstract class ArticleRepository {

  /// `getNewsArticles` is an abstract method that fetches news articles.
  /// It returns a `Future` of `DataState` that wraps a list of `ArticleEntity`.
  /// The `Future` indicates that the result of the method might not be available immediately,
  /// and the `DataState` is used to represent the state of the data fetch operation.
  /// The `List<ArticleEntity>` represents the list of articles that are fetched.
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}