import 'package:equatable/equatable.dart';

/// `ArticleEntity` is a class that represents an article with various properties.
/// It extends the `Equatable` class to simplify equality comparisons.
class ArticleEntity extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  /// The `props` getter is overridden from the `Equatable` class.
  /// This getter returns a list of the properties of the `ArticleEntity` class.
  /// The `Equatable` class uses this list to perform the comparison when the `==` operator is used.
  @override
  List < Object? > get props {
    return [
      id,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}