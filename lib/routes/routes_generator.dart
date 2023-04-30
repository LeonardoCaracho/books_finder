import 'package:books_finder/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:books_finder/book_details/book_details.dart';
import 'package:books_finder/books_search/books_search.dart';
import 'package:books_finder/favorites/view/favorites_page.dart';
import 'package:books_repository/books_repository.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return BooksSearchPage.route();

      case Routes.bookDetails:
        if (args is Book) {
          return BookDetailsPage.route(args);
        }
        return _errorRoute();

      case Routes.favorites:
        return FavoritesPage.route();

      default:
        return _errorRoute();
    }
  }

  // error screen
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Error ! Something went wrong',
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
        ),
      );
    });
  }
}
