import 'dart:convert';

import 'package:books_repository/books_repository.dart';
import 'package:books_storage/books_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BooksStorageImpl extends BooksStorage {
  BooksStorageImpl({
    required SharedPreferences plugin,
  }) : _plugin = plugin;

  final SharedPreferences _plugin;

  static const kBooksCollectionKey = '__books_collection_key__';

  @override
  List<Book> getStoredBooks() {
    final booksString = _plugin.getString(kBooksCollectionKey) ?? '[]';
    final booksDecoded = json.decode(booksString);
    return booksDecoded.map((bookJson) => Book.fromJson(bookJson)).whereType<Book>().toList();
  }

  @override
  Future<void> deleteStoredBook(Book book) async {
    final books = getStoredBooks();
    books.remove(book);

    await _updateStorage(books);
  }

  @override
  Future<void> saveBook(Book book) async {
    final books = getStoredBooks();

    final bookExists = books.any((b) => b.id == book.id);

    if (bookExists) {
      throw Exception("Duplicated registry!");
    }

    books.add(book);

    await _updateStorage(books);
  }

  Future<void> _updateStorage(List<Book> books) async {
    final encodedBooks = json.encode(books.map((book) => book.toJson()).toList());
    await _plugin.setString(kBooksCollectionKey, encodedBooks);
  }
}
