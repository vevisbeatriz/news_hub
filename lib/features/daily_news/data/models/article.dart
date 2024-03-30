import 'package:floor/floor.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';

/// `ArticleResponseModel` is a model class for handling the response from the news API.
class ArticleResponseModel {
  List<ArticleModel> articles;

  ArticleResponseModel({required this.articles});

  /// A factory constructor for `ArticleResponseModel` that creates an instance from a JSON object.
  factory ArticleResponseModel.fromJson(
      Map<String, dynamic> articleResponseData) {
    return ArticleResponseModel(
        articles: ((articleResponseData['articles'] ?? []) as List<dynamic>)
            .map((dynamic article) => ArticleModel.fromJson(article))
            .toList());
  }
}

/// `ArticleModel` is a model class for handling individual articles in the response from the news API.
@Entity(tableName: 'articles', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
    id: id,
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  /// A factory constructor for `ArticleModel` that creates an instance from a JSON object.
  factory ArticleModel.fromJson(Map<String, dynamic> articleModelData) {
    return ArticleModel(
      author: articleModelData['author'] ?? "",
      title: articleModelData['title'] ?? "",
      description: articleModelData['description'] ?? "",
      url: articleModelData['url'] ?? "",
      urlToImage: articleModelData['urlToImage'] ?? "",
      publishedAt: articleModelData['publishedAt'] ?? "",
      content: articleModelData['content'] ?? "",
    );
  }

  /// A factory constructor for `ArticleModel` that creates an instance from an `ArticleEntity`.
  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}