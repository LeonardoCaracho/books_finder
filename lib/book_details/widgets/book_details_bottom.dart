import 'package:books_finder/book_details/book_details.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:flutter/material.dart';

class BookDetailsBottom extends StatelessWidget {
  const BookDetailsBottom({
    super.key,
    required this.book,
  });

  final Book book;

  void _showToast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.grey[600],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookDetailsCubit, BookDetailsState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          _showToast(context, "Add to favorites failed!");
        }

        if (state.status.isSuccess) {
          _showToast(context, "Add to favorites succeed!");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 10,
            right: 15,
            top: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: BottomIconButton(
                  text: "Buy",
                  onPressed: () {},
                  icon: Icons.shop,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: BottomIconButton(
                  text: "Add to favorites",
                  onPressed: () {
                    context.read<BookDetailsCubit>().addBookToFavorites(book);
                  },
                  icon: Icons.favorite,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
