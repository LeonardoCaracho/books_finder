import 'package:books_finder/books_search/books_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BooksSearchState', () {
    test('supports value comparison', () {
      expect(BooksSearchInitial(), BooksSearchInitial());
      expect(
        BooksSearchIsLoading(),
        isNot(equals(BooksSearchIsLoadSuccess(books: const []))),
      );
      expect(
        BooksSearchIsLoadSuccess(books: const []),
        BooksSearchIsLoadSuccess(books: const []),
      );
      expect(
        BooksSearchIsFailure(),
        isNot(equals(BooksSearchIsLoadSuccess(books: const []))),
      );
    });
  });
}
