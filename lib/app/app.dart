import 'package:books_api/books_api.dart';
import 'package:books_finder/routes/routes_generator.dart';
import 'package:books_finder/books_search/books_search.dart';
import 'package:books_repository/books_repository.dart';
import 'package:books_storage/books_storage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.booksStorage,
    required this.booksApi,
  });

  final BooksStorage booksStorage;
  final BooksApi booksApi;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BooksRepositoryImpl(
        booksApi: booksApi,
        booksStorage: booksStorage,
      ),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
