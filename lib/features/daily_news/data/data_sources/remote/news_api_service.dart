// Importing necessary packages and constants.
import 'package:news_hub/core/constants/constants.dart';
import 'package:news_hub/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

// This is a part directive in Dart. It's used to split a library into multiple Dart files.
// It contains implementations for the methods and classes declared in `news_api_service.dart`.
// Note: You should not manually modify this file as it is auto-generated and your changes will be overwritten the next time code generation runs.
part 'news_api_service.g.dart';

// `NewsAPIService` is an abstract class that provides a way to interact with a news API.
// It uses the Retrofit library to perform HTTP requests and the Dio library to handle the requests.
@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsAPIService {
  // Factory constructor that creates an instance of `_NewsAPIService`, which is presumably a class that implements the `NewsAPIService` interface.
  factory NewsAPIService(Dio dio) = _NewsAPIService;

  // `getNewsArticles` is a method that fetches top news headlines from a remote API.
 // The method is asynchronous and returns a `Future` of `HttpResponse` that wraps a list of `ArticleModel`.
  @GET('/top-headlines')
  Future<HttpResponse<ArticleResponseModel>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });
}