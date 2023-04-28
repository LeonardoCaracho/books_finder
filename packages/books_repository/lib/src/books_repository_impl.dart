import 'package:books_api/books_api.dart' as api;
import 'package:books_repository/books_repository.dart';
import 'package:books_storage/books_storage.dart';

class BooksRepositoryImpl extends BooksRepository {
  BooksRepositoryImpl({
    required this.booksApi,
    required this.booksStorage,
  });

  final api.BooksApi booksApi;
  final BooksStorage booksStorage;

  @override
  Future<List<Book>> getBooksBySearch(String query) async {
    final response = await booksApi.getBooksBySearch(query);
    return response.map((book) => Book.fromApi(book)).toList();
  }

  @override
  Future<List<Book>> getStoredBooks() async {
    return booksStorage.getStoredBooks();
  }

  @override
  Future<void> saveBook(Book book) async {
    await booksStorage.saveBook(book);
  }

  @override
  Future<void> deleteBook(Book book) async {
    await booksStorage.deleteStoredBook(book);
  }
}
