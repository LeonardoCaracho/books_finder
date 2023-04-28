import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:flutter/material.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            book.title,
            style: const TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black38,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        background: Image.network(
          book.thumbnail ?? AppConstants.placeholderDetails,
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.6),
          colorBlendMode: BlendMode.darken,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
