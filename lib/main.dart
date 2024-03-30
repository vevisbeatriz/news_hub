import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/config/theme/app_themes.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_hub/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_hub/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_hub/injection_container.dart';

// Main function to initialize the app
Future<void> main() async {
  // Ensuring the widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing dependencies
  await initializeDependencies();
  runApp(const MyApp());
}

// `MyApp` is the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
        create: (context) =>
            sl()..add(const GetArticles()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const DailyNews(),
        ));
  }
}
