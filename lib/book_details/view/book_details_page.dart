import 'package:flutter/material.dart';
import 'package:books_finder/book_details/book_details.dart';
import 'package:books_repository/books_repository.dart';

class BookDetailsPage extends StatelessWidget {
  /// {@macro book_details_page}
  const BookDetailsPage({
    super.key,
    required this.book,
  });

  final Book book;

  /// The static route for BookDetailsPage
  static Route<dynamic> route(Book book) {
    return MaterialPageRoute<dynamic>(builder: (_) => BookDetailsPage(book: book));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsView(book: book),
      bottomSheet: book.buyLink != null
          ? BookDetailsBottom(
              url: book.buyLink!,
            )
          : const SizedBox.shrink(),
    );
  }
}

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: [
          BookDetailsAppBar(book: book),
          SliverList(
            delegate: SliverChildListDelegate([
              BookDetailsBody(
                book: book,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
