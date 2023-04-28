import 'package:books_api/books_api.dart';
import 'package:books_storage/books_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final BooksStorage booksStorage = BooksStorageImpl(
    plugin: await SharedPreferences.getInstance(),
  );

  final BooksApi booksApi = BooksApiImpl();

  runApp(
    App(
      booksApi: booksApi,
      booksStorage: booksStorage,
    ),
  );
}
