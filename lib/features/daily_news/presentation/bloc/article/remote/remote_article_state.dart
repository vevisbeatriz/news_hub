import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';

/// It represents different states of a remote operation to fetch articles.
abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  /// The constructor for `RemoteArticlesState`. It takes two optional named parameters: `articles` and `error`.
  const RemoteArticlesState({this.articles, this.error});

  /// The `props` getter is overridden to return a list containing `articles` and `error`.
  /// This list is used by `Equatable` to determine equality.
  @override
  List<Object?> get props => [articles!, error!];
}

/// It represents the state where the articles are being fetched.
class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

/// It represents the state where the articles have been successfully fetched.
/// It has a named constructor that takes an optional list of `ArticleEntity` objects and passes it to the superclass constructor.
class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone({List<ArticleEntity>? article}) : super(articles: article);
}

/// It represents the state where an error occurred while fetching the articles.
/// It has a named constructor that takes an optional `DioException` and passes it to the superclass constructor.
class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError({DioException? error}) : super(error: error);
}