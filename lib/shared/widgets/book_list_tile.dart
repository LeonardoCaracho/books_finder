import 'package:flutter/material.dart';
import 'package:books_finder/book_details/book_details.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({
    super.key,
    required this.book,
    required this.trailIcon,
    this.trailAction,
  });

  final Book book;
  final Icon trailIcon;
  final void Function()? trailAction;

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
                icon: trailIcon,
                onPressed: trailAction,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
