// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/books_search/bloc/bloc.dart';

void main() {
  group('BooksSearchState', () {
    test('supports value equality', () {
      expect(
        BooksSearchState(),
        equals(
          const BooksSearchState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const BooksSearchState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const booksSearchState = BooksSearchState(
            customProperty: 'My property',
          );
          expect(
            booksSearchState.copyWith(),
            equals(booksSearchState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const booksSearchState = BooksSearchState(
            customProperty: 'My property',
          );
          final otherBooksSearchState = BooksSearchState(
            customProperty: 'My property 2',
          );
          expect(booksSearchState, isNot(equals(otherBooksSearchState)));

          expect(
            booksSearchState.copyWith(
              customProperty: otherBooksSearchState.customProperty,
            ),
            equals(otherBooksSearchState),
          );
        },
      );
    });
  });
}
