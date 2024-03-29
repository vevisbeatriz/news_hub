import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_hub/core/constants/constants.dart';
import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_hub/features/daily_news/data/models/article.dart';
import 'package:news_hub/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsAPIService _newsAPIService;

  ArticleRepositoryImpl(this._newsAPIService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsAPIService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

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
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
