import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:flutter/material.dart';

class BookDetailsBottom extends StatelessWidget {
  const BookDetailsBottom({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              icon: Icons.favorite,
            ),
          ),
        ],
      ),
    );
  }
}
