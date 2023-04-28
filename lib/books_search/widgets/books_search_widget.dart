import 'package:flutter/material.dart';
import 'package:books_finder/books_search/books_search.dart';

class BooksSearchWidget extends StatelessWidget {
  const BooksSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      onSubmitted: (text) {
        context.read<BooksSearchBloc>().add(
              BooksSearchEvent(
                query: text,
              ),
            );
      },
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search),
        hintText: 'Search',
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
