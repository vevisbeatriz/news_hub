import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/core/usecase/usecase.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/features/daily_news/domain/repository/article_repository.dart';

/// `SaveArticleUseCase` saves an article by implementing the `UseCase` interface.
class SaveArticleUseCase implements UseCase<void,ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  /// Saves an article by calling the `saveArticle` method on `_articleRepository`.
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}