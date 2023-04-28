// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:books_finder/books_search/books_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BooksSearchBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => BooksSearchBloc(),
          child: MaterialApp(home: BooksSearchBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
