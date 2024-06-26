import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_hub/injection_container.dart';
import 'package:news_hub/features/daily_news/domain/entities/article.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:news_hub/features/daily_news/presentation/widgets/article_tile.dart';

// `SavedArticles` displays a list of saved articles.
class SavedArticles extends HookWidget {
  const SavedArticles({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(const GetSavedArticles()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  // AppBar with a back button and a title
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      title: const Text('Saved Articles', style: TextStyle(color: Colors.black)),
    );
  }

  // Body with a list of articles or a loading indicator
  Widget _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticlesState>(
      builder: (context, state) {
        if (state is LocalArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalArticlesDone) {
          return _buildArticlesList(state.articles!);
        }
        return Container();
      },
    );
  }

  // List of articles or a message if the list is empty
  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
          child: Text(
            'NO SAVED ARTICLES',
            style: TextStyle(color: Colors.black),
          ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onDeleteArticle(context, article),
          onArticlePressed: (article) => _onArticlePressed(context, article),
        );
      },
    );
  }

  // Handles the back button tap event
  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  // Handles the delete article event
  void _onDeleteArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(DeleteArticle(article));
  }

  // Navigates to the article details view
  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}