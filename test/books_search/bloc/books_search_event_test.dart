// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/books_search/bloc/bloc.dart';

void main() {
  group('BooksSearchEvent', () {  
    group('CustomBooksSearchEvent', () {
      test('supports value equality', () {
        expect(
          CustomBooksSearchEvent(),
          equals(const CustomBooksSearchEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomBooksSearchEvent(),
          isNotNull
        );
      });
    });
  });
}
