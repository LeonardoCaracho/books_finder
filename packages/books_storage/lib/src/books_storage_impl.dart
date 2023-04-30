import 'dart:convert';
import 'dart:io';

import 'package:books_repository/books_repository.dart';
import 'package:books_storage/books_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

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

    if (books.any((b) => b.id == book.id)) {
      throw Exception("Duplicated registry!");
    }

    if (book.thumbnail != null) {
      book = await _saveImageToLocalStorage(book);
    }

    books.add(book);

    await _updateStorage(books);
  }

  Future<Book> _saveImageToLocalStorage(Book book) async {
    var imageResponse = await http.get(Uri.parse(book.thumbnail!));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final imagePath = path.join(documentDirectory.path, path.basename(book.thumbnail!));
    final file = File(imagePath);
    await file.writeAsBytes(imageResponse.bodyBytes);
    return book.copyWith(imageCachedPath: imagePath);
  }

  Future<void> _updateStorage(List<Book> books) async {
    final encodedBooks = json.encode(books.map((book) => book.toJson()).toList());
    await _plugin.setString(kBooksCollectionKey, encodedBooks);
  }
}
