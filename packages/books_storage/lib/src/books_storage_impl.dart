import 'dart:convert';

import 'package:books_api/books_api.dart';
import 'package:books_storage/books_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookStorageImpl extends BooksStorage {
  BookStorageImpl({
    required SharedPreferences plugin,
  }) : _plugin = plugin;

  final SharedPreferences _plugin;

  static const kBooksCollectionKey = '__books_collection_key__';

  @override
  Future<List<Book>> getStoredBooks() async {
    final booksString = _plugin.getString(kBooksCollectionKey) ?? '[]';
    return json.decode(booksString).map((bookJson) => Book.fromJson(bookJson)).toList();
  }

  @override
  Future<void> deleteStoredBook(Book book) async {
    final books = await getStoredBooks();
    books.remove(book);

    _updateStorage(books);
  }

  @override
  Future<void> saveBook(Book book) async {
    final books = await getStoredBooks();
    books.add(book);

    _updateStorage(books);
  }

  Future<void> _updateStorage(List<Book> books) async {
    final encodedBooks = json.encode(books.map((book) => book.toJson()).toList());
    await _plugin.setString(kBooksCollectionKey, encodedBooks);
  }
}
