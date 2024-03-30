import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_hub/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:news_hub/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/features/daily_news/presentation/widgets/article_tile.dart';

// `DailyNews` displays a list of daily news articles.
class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  // AppBar with a title and a bookmark button
  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  // Body with a list of articles or a loading/error indicator
  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
                onArticlePressed: (article) =>
                    _onArticlePressed(context, article),
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  // Navigates to the article details view
  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailsView(
          article: article,
        ),
      ),
    );
  }

  // Navigates to the saved articles view
  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SavedArticles(),
      ),
    );
  }
}