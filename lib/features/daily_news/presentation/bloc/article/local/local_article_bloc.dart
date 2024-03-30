import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/features/daily_news/domain/usecases/delete_article.dart';
import 'package:news_hub/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_hub/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

/// `LocalArticleBloc` is a class that extends the `Bloc` class from the `flutter_bloc` package.
/// It manages the state of local articles in the application.
/// It uses `GetSavedArticleUseCase`, `SaveArticleUseCase`, and `DeleteArticleUseCase` to perform operations on articles.
class LocalArticleBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  /// The constructor initializes the use cases and sets the initial state to `LocalArticlesLoading`.
  /// It also defines the event handlers for `GetSavedArticles`, `DeleteArticle`, and `SaveArticle` events.
  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._deleteArticleUseCase)
      : super(const LocalArticlesLoading()){
    on <GetSavedArticles>(onGetSavedArticles);
    on <DeleteArticle>(onDeleteArticle);
    on <SaveArticle>(onSaveArticle);
  }

  /// Handles the `GetSavedArticles` event by fetching the saved articles and emitting a `LocalArticlesDone` state with the fetched articles.
  void onGetSavedArticles(GetSavedArticles event,Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  /// Handles the `DeleteArticle` event by deleting the specified article and emitting a `LocalArticlesDone` state with the updated list of articles.
  void onDeleteArticle(DeleteArticle deleteArticle, Emitter<LocalArticlesState> emit) async {
    await _deleteArticleUseCase(params: deleteArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  /// Handles the `SaveArticle` event by saving the specified article and emitting a `LocalArticlesDone` state with the updated list of articles.
  void onSaveArticle(SaveArticle saveArticle, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}