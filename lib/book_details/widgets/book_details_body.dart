import 'package:flutter/material.dart';
import 'package:books_finder/book_details/cubit/cubit.dart';

/// {@template book_details_body}
/// Body of the BookDetailsPage.
///
/// Add what it does
/// {@endtemplate}
class BookDetailsBody extends StatelessWidget {
  /// {@macro book_details_body}
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
