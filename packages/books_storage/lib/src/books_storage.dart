import 'package:books_repository/books_repository.dart';

abstract class BooksStorage {
  List<Book> getStoredBooks();

  Future<void> deleteStoredBook(Book book);

  Future<void> saveBook(Book book);
}
