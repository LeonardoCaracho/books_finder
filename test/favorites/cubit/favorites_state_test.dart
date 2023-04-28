// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/favorites/cubit/cubit.dart';

void main() {
  group('FavoritesState', () {
    test('supports value equality', () {
      expect(
        FavoritesState(),
        equals(
          const FavoritesState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const FavoritesState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const favoritesState = FavoritesState(
            customProperty: 'My property',
          );
          expect(
            favoritesState.copyWith(),
            equals(favoritesState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const favoritesState = FavoritesState(
            customProperty: 'My property',
          );
          final otherFavoritesState = FavoritesState(
            customProperty: 'My property 2',
          );
          expect(favoritesState, isNot(equals(otherFavoritesState)));

          expect(
            favoritesState.copyWith(
              customProperty: otherFavoritesState.customProperty,
            ),
            equals(otherFavoritesState),
          );
        },
      );
    });
  });
}
