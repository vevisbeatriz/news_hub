import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/core/usecase/usecase.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/features/daily_news/domain/repository/article_repository.dart';

/// `GetArticleUseCase` is a class that implements the `UseCase` interface.
/// It is responsible for fetching a list of articles.
class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  /// The `call` method is implemented from the `UseCase` interface.
  /// It returns a `Future<DataState<List<ArticleEntity>>>`, which is a future that will complete with a `DataState` object containing a list of `ArticleEntity` objects.
  /// The `call` method does not take any parameters and simply calls the `getNewsArticles` method on `_articleRepository`.
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}