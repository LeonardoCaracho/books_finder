import 'package:books_api/books_api.dart';

abstract class BooksApi {
  Future<List<Book>> getBooksBySearch(String query);
}
