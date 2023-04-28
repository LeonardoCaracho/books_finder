// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/book_details/cubit/cubit.dart';

void main() {
  group('BookDetailsState', () {
    test('supports value equality', () {
      expect(
        BookDetailsState(),
        equals(
          const BookDetailsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const BookDetailsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const bookDetailsState = BookDetailsState(
            customProperty: 'My property',
          );
          expect(
            bookDetailsState.copyWith(),
            equals(bookDetailsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const bookDetailsState = BookDetailsState(
            customProperty: 'My property',
          );
          final otherBookDetailsState = BookDetailsState(
            customProperty: 'My property 2',
          );
          expect(bookDetailsState, isNot(equals(otherBookDetailsState)));

          expect(
            bookDetailsState.copyWith(
              customProperty: otherBookDetailsState.customProperty,
            ),
            equals(otherBookDetailsState),
          );
        },
      );
    });
  });
}
