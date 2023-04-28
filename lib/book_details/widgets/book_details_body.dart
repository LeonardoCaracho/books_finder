import 'package:books_repository/books_repository.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  /// {@macro book_details_body}
  const BookDetailsBody({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            book.publisher,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Text(book.description),
          ),
          Wrap(
            spacing: 5,
            children: book.authors
                .map(
                  (genre) => Chip(
                    label: Text(
                      genre,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
