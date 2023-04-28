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
    return BlocProvider(
      create: (context) => BooksSearchBloc(
        booksRepository: context.read<BooksRepositoryImpl>(),
      ),
      child: const Scaffold(
        body: BooksSearchView(),
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
