// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/favorites/cubit/cubit.dart';

void main() {
  group('FavoritesCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          FavoritesCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final favoritesCubit = FavoritesCubit();
      expect(favoritesCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<FavoritesCubit, FavoritesState>(
      'yourCustomFunction emits nothing',
      build: FavoritesCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <FavoritesState>[],
    );
  });
}
