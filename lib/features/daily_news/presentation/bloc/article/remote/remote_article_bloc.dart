import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

// `RemoteArticlesBloc` is a class that extends `Bloc` and manages the state of remote articles.
// It uses `GetArticleUseCase` to perform operations on articles.
class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent,RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()) {
    on <GetArticles> (onGetArticles);
  }

  // Fetches articles and emits appropriate state based on the result
  Future<void> onGetArticles(GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataState = await _getArticleUseCase();

    // If fetching is successful and articles are not empty, emit `RemoteArticlesDone` state
    if(dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(article: dataState.data));
    }
    // If fetching fails, emit `RemoteArticlesError` state
    if(dataState is DataFailed) {
      emit(RemoteArticlesError(error: dataState.error));
    }
  }
}