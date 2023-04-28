import 'package:flutter/material.dart';
import 'package:books_finder/books_search/bloc/bloc.dart';

/// {@template books_search_body}
/// Body of the BooksSearchPage.
///
/// Add what it does
/// {@endtemplate}
class BooksSearchBody extends StatelessWidget {
  /// {@macro books_search_body}
  const BooksSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksSearchBloc, BooksSearchState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
