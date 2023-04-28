import 'package:flutter/material.dart';
import 'package:books_finder/book_details/cubit/cubit.dart';
import 'package:books_finder/book_details/widgets/book_details_body.dart';

/// {@template book_details_page}
/// A description for BookDetailsPage
/// {@endtemplate}
class BookDetailsPage extends StatelessWidget {
  /// {@macro book_details_page}
  const BookDetailsPage({super.key});

  /// The static route for BookDetailsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const BookDetailsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookDetailsCubit(),
      child: const Scaffold(
        body: BookDetailsView(),
      ),
    );
  }    
}

/// {@template book_details_view}
/// Displays the Body of BookDetailsView
/// {@endtemplate}
class BookDetailsView extends StatelessWidget {
  /// {@macro book_details_view}
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BookDetailsBody();
  }
}
