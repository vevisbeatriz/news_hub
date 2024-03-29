import 'package:news_hub/features/daily_news/domain/entities/article.dart';

/// `ArticleModel` is a class that extends `ArticleEntity`.
/// It represents an article with various properties such as `id`, `author`, `title`, `description`, `url`, `urlToImage`, `publishedAt`, and `content`.
class ArticleModel extends ArticleEntity {

  /// The constructor for the `ArticleModel` class. It takes named parameters for each of its properties.
  /// All these properties are nullable, meaning they can hold a null value.
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  /// `fromJson` is a factory constructor that creates an instance of `ArticleModel` from a `Map<String, dynamic>` that represents a JSON object.
  /// It uses the `??` operator to provide default values for the properties in case the corresponding key is not present in the map or its value is null.
  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}