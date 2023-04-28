// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/book_details/cubit/cubit.dart';

void main() {
  group('BookDetailsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          BookDetailsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final bookDetailsCubit = BookDetailsCubit();
      expect(bookDetailsCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<BookDetailsCubit, BookDetailsState>(
      'yourCustomFunction emits nothing',
      build: BookDetailsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <BookDetailsState>[],
    );
  });
}
