import 'package:books_finder/book_details/book_details.dart';
import 'package:books_finder/favorites/cubit/cubit.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:flutter/material.dart';

class SearchResultListTile extends StatelessWidget {
  const SearchResultListTile({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).push(BookDetailsPage.route(book)),
            child: ListTile(
              leading: Image.network(
                book.thumbnail ?? AppConstants.placeholderList,
              ),
              title: Text(book.title),
              subtitle: Text(book.authors.join(' · ')),
              trailing: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  context.read<FavoritesCubit>().addFavorite(book);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
