import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/core/usecase/usecase.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/features/daily_news/domain/repository/article_repository.dart';

/// `GetArticleUseCase` fetches a list of articles by implementing the `UseCase` interface.
class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  /// Fetches a list of articles by calling the `getNewsArticles` method on `_articleRepository`.
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}