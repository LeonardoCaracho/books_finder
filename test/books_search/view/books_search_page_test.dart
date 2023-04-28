// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:books_finder/books_search/books_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BooksSearchPage', () {
    group('route', () {
      test('is routable', () {
        expect(BooksSearchPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders BooksSearchView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BooksSearchPage()));
      expect(find.byType(BooksSearchView), findsOneWidget);
    });
  });
}
