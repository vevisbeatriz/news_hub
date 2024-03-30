import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/core/usecase/usecase.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/features/daily_news/domain/repository/article_repository.dart';

/// `DeleteArticleUseCase` is a use case for deleting an article.
/// It implements the `UseCase` interface with a `void` return type and `ArticleEntity` as the parameter type.
class DeleteArticleUseCase implements UseCase<void,ArticleEntity> {
  final ArticleRepository _articleRepository;

  DeleteArticleUseCase(this._articleRepository);

  /// Deletes an article by calling the `deleteArticle` method on `_articleRepository`.
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.deleteArticle(params!);
  }
}