import 'package:books_repository/src/models/models.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooksBySearch(String query);
  Future<List<Book>> getStoredBooks();
  Future<void> saveBook(Book book);
  Future<void> deleteBook(Book book);
}
