// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:books_finder/favorites/favorites.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FavoritesPage', () {
    group('route', () {
      test('is routable', () {
        expect(FavoritesPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders FavoritesView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: FavoritesPage()));
      expect(find.byType(FavoritesView), findsOneWidget);
    });
  });
}
