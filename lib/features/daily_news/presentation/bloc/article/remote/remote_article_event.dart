// `RemoteArticlesEvent` is an abstract class that represents a generic event related to remote articles.
abstract class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

// `GetArticles` is a class that extends `RemoteArticlesEvent` and represents a specific event to get articles.
class GetArticles extends RemoteArticlesEvent {
  const GetArticles();
}