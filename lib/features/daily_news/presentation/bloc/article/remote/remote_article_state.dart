import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';

/// `RemoteArticlesState` represents states of a remote operation to fetch articles.
abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

/// State representing the loading phase of fetching articles.
class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

/// State representing successful fetching of articles.
class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone({List<ArticleEntity>? article}) : super(articles: article);
}

/// State representing an error occurred while fetching articles.
class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError({DioException? error}) : super(error: error);
}