import 'package:books_finder/favorites/favorites.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/shared/shared.dart';

void main() {
  group('FavoritesState', () {
    test('supports value comparison', () {
      expect(
        const FavoritesState(status: Status.initial, books: []),
        const FavoritesState(status: Status.initial, books: []),
      );
    });

    test('copyWith comparisons are correct', () {
      const oldState = FavoritesState(
        status: Status.success,
        books: [],
      );

      final newState = oldState.copyWith(status: Status.loading);

      expect(oldState != newState, true);
      expect(newState.status, Status.loading);
      expect(newState.books, oldState.books);
    });
  });
}
