import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/core/resources/data_state.dart';

abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}