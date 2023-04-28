import 'package:books_repository/books_repository.dart';
import 'package:flutter/material.dart';
import 'package:books_finder/favorites/cubit/cubit.dart';
import 'package:books_finder/favorites/widgets/favorites_body.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  /// The static route for FavoritesPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const FavoritesPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(
        booksRepository: context.read<BooksRepositoryImpl>(),
      )..getFavorites(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Favorites"),
          centerTitle: true,
        ),
        body: const FavoritesView(),
      ),
    );
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesBody();
  }
}
