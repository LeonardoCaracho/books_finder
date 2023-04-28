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
            "Author(s): ${book.authors.join(', ')}",
            style: Theme.of(context).textTheme.labelSmall,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            "Publisher: ${book.publisher}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Text(
              book.description,
              textAlign: TextAlign.justify,
            ),
          ),
          Row(
            children: [
              Text(
                "Categories: ",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Wrap(
                spacing: 5,
                children: book.categories
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
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
