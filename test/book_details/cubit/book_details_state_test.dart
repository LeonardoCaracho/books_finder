import 'package:books_finder/book_details/book_details.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookDetailsState', () {
    test('supports value comparison', () {
      expect(
        const BookDetailsState(),
        const BookDetailsState(),
      );
      expect(
        const BookDetailsState(status: Status.loading),
        const BookDetailsState(status: Status.loading),
      );
    });

    test('copies with new values', () {
      const original = BookDetailsState(status: Status.initial);
      final copy = original.copyWith(status: Status.loading);

      expect(copy.status, Status.loading);
    });
  });
}
