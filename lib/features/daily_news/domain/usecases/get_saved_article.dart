import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/core/usecase/usecase.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/features/daily_news/domain/repository/article_repository.dart';

/// `GetSavedArticleUseCase` fetches saved articles by implementing the `UseCase` interface.
class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>,void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  /// Fetches saved articles by calling the `getSavedArticles` method on `_articleRepository`.
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}