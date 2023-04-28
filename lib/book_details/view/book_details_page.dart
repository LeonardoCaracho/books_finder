import 'package:books_finder/book_details/book_details.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:flutter/material.dart';

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
    return BlocProvider(
      create: (context) => BookDetailsCubit(
        booksRepository: context.read<BooksRepositoryImpl>(),
      ),
      child: Scaffold(
        body: BookDetailsView(book: book),
        bottomSheet: BookDetailsBottom(
          book: book,
        ),
      ),
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
          SliverAppBar(
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(book.title),
              centerTitle: true,
              background: Image.network(
                book.thumbnail ?? AppConstants.placeholderDetails,
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.5),
                colorBlendMode: BlendMode.modulate,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
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
