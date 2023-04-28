import 'package:books_api/books_api.dart';

abstract class BooksStorage {
  Future<List<Book>> getStoredBooks();

  Future<void> deleteStoredBook(Book book);

  Future<void> saveBook(Book book);
}
