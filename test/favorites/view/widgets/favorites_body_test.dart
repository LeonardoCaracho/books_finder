// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:books_finder/favorites/favorites.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FavoritesBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => FavoritesCubit(),
          child: MaterialApp(home: FavoritesBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
