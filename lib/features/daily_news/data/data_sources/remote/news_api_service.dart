import 'package:news_hub/core/constants/constants.dart';
import 'package:news_hub/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

/// This is a part directive in Dart. It's used to split a library into multiple Dart files.
/// You should not manually modify this file as it is auto-generated and your changes will be overwritten the next time code generation runs.
part 'news_api_service.g.dart';

/// `NewsAPIService` provides methods to interact with a news API.
@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsAPIService {
  factory NewsAPIService(Dio dio) = _NewsAPIService;

  /// Fetches top news headlines from a remote API.
  @GET('/top-headlines')
  Future<HttpResponse<ArticleResponseModel>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });
}