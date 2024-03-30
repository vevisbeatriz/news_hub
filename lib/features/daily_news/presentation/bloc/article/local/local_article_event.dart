import 'package:equatable/equatable.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';

/// `LocalArticlesEvent` is an abstract class that extends `Equatable`.
/// It represents a generic event related to local articles.
/// Each specific event related to local articles should extend this class.
/// It has an optional `ArticleEntity` property that can be used to pass the article related to the event.
abstract class LocalArticlesEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticlesEvent({this.article});

  @override
  List<Object> get props => [article!];
}

/// `GetSavedArticles` is a class that extends `LocalArticlesEvent`.
/// It represents the event of fetching saved articles.
class GetSavedArticles extends LocalArticlesEvent {
  const GetSavedArticles();
}

/// `DeleteArticle` is a class that extends `LocalArticlesEvent`.
/// It represents the event of deleting an article.
class DeleteArticle extends LocalArticlesEvent {
  DeleteArticle(ArticleEntity article) : super(article: article);
}

/// `SaveArticle` is a class that extends `LocalArticlesEvent`.
/// It represents the event of saving an article.
class SaveArticle extends LocalArticlesEvent {
  SaveArticle(ArticleEntity article) : super(article: article);
}