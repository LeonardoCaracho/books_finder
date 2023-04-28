// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:books_finder/book_details/book_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookDetailsPage', () {
    group('route', () {
      test('is routable', () {
        expect(BookDetailsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders BookDetailsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BookDetailsPage()));
      expect(find.byType(BookDetailsView), findsOneWidget);
    });
  });
}
