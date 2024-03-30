import 'package:equatable/equatable.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';

/// `LocalArticlesState` is an abstract class that extends `Equatable`.
/// It represents the state of local articles.
abstract class LocalArticlesState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticlesState({this.articles});

  @override
  List<Object?> get props => [articles!];
}

/// State representing the loading phase of fetching articles.
class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

/// State representing successful fetching of articles.
class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}