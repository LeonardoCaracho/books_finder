import 'package:books_finder/books_search/books_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BooksSearchEvent', () {
    test('creating a const BooksSearchEvent should not throw errors', () {
      expect(
        () => const BooksSearchEvent(query: ''),
        returnsNormally,
      );
    });

    test('query parameter should be correctly saved in the object', () {
      const query = 'Harry Potter';
      const event = BooksSearchEvent(query: query);

      expect(event.query, equals(query));
    });

    test('props getter should return a list with the saved query', () {
      const query = 'Flutter development';
      const event = BooksSearchEvent(query: query);

      expect(event.props, equals([query]));
    });
  });
}
