import 'package:floor/floor.dart';
import 'package:news_hub/features/daily_news/data/models/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getArticles();
}
