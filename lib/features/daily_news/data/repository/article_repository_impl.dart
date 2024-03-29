import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_hub/core/constants/constants.dart';
import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_hub/features/daily_news/data/models/article.dart';
import 'package:news_hub/features/daily_news/domain/repository/article_repository.dart';

/// `ArticleRepositoryImpl` is a class that implements the `ArticleRepository` interface.
/// It fetches news articles from a remote API using the `NewsAPIService`.
class ArticleRepositoryImpl implements ArticleRepository {
  final NewsAPIService _newsAPIService;

  ArticleRepositoryImpl(this._newsAPIService);

  /// `getNewsArticles` is an overridden method from the `ArticleRepository` interface.
  /// It fetches news articles from a remote API and returns a `Future` of `DataState` that wraps a list of `ArticleModel`.
  /// It uses a `try-catch` block to handle potential errors during the network request.
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      /// The `getNewsArticles` method of the `_newsAPIService` is called with some parameters to fetch the news articles.
      final httpResponse = await _newsAPIService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      /// If the HTTP status code of the response is OK (200), the method returns a `DataSuccess` state with the data from the response.
      /// Otherwise, it returns a `DataFailed` state with a `DioException` that contains information about the error.
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
      /// If a `DioException` is thrown during the network request, the `catch` block catches it and returns a `DataFailed` state with the caught exception.
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}