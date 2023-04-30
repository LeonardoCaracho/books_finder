import 'package:books_finder/routes/routes.dart';
import 'package:books_finder/favorites/favorites.dart';
import 'package:books_repository/books_repository.dart';
import 'package:flutter/material.dart';
import 'package:books_finder/books_search/bloc/bloc.dart';
import 'package:books_finder/books_search/widgets/books_search_body.dart';

class BooksSearchPage extends StatelessWidget {
  const BooksSearchPage({super.key});

  /// The static route for BooksSearchPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const BooksSearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BooksSearchBloc(
            booksRepository: context.read<BooksRepositoryImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(
            booksRepository: context.read<BooksRepositoryImpl>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Books Finder"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.favorites),
              icon: const Icon(Icons.favorite),
            )
          ],
        ),
        body: const BooksSearchView(),
      ),
    );
  }
}

class BooksSearchView extends StatelessWidget {
  const BooksSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BooksSearchBody();
  }
}
