import 'package:news_hub/core/resources/data_state.dart';
import 'package:news_hub/features/daily_news/data/models/article.dart';
import 'package:news_hub/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future < DataState < List < ArticleModel >>> getNewsArticles() {
    // TODO: Implement getNewsArticles
    throw UnimplementedError();
  }
}