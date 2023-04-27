import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:books_api/books_api.dart';

class BooksRequestFailure implements Exception {}

class BooksApiImpl extends BooksApi {
  BooksApiImpl({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  static const _baseUrlGoogleApi = 'www.googleapis.com';

  final http.Client _httpClient;

  @override
  Future<List<Book>> getBooksBySearch(String query) async {
    final booksRequest = Uri.https(
      _baseUrlGoogleApi,
      '/books/v1/volumes',
      {'q': query},
    );

    final booksResponse = await _httpClient.get(booksRequest);

    if (booksResponse.statusCode != 200) {
      throw BooksRequestFailure();
    }

    final booksJson = jsonDecode(booksResponse.body) as Map;

    if (!booksJson.containsKey('items')) {
      throw BooksRequestFailure();
    }

    final items = booksJson['items'] as List;

    return items.map((item) => Book.fromJson(item)).toList();
  }
}
