// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/books_search/bloc/bloc.dart';

void main() {
  group('BooksSearchBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          BooksSearchBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final booksSearchBloc = BooksSearchBloc();
      expect(booksSearchBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<BooksSearchBloc, BooksSearchState>(
      'CustomBooksSearchEvent emits nothing',
      build: BooksSearchBloc.new,
      act: (bloc) => bloc.add(const CustomBooksSearchEvent()),
      expect: () => <BooksSearchState>[],
    );
  });
}
