import 'package:flutter/material.dart';
import 'package:books_finder/books_search/bloc/bloc.dart';
import 'package:books_finder/books_search/widgets/books_search_body.dart';

/// {@template books_search_page}
/// A description for BooksSearchPage
/// {@endtemplate}
class BooksSearchPage extends StatelessWidget {
  /// {@macro books_search_page}
  const BooksSearchPage({super.key});

  /// The static route for BooksSearchPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const BooksSearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksSearchBloc(),
      child: const Scaffold(
        body: BooksSearchView(),
      ),
    );
  }    
}

/// {@template books_search_view}
/// Displays the Body of BooksSearchView
/// {@endtemplate}
class BooksSearchView extends StatelessWidget {
  /// {@macro books_search_view}
  const BooksSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BooksSearchBody();
  }
}
