// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:books_finder/book_details/book_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookDetailsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => BookDetailsCubit(),
          child: MaterialApp(home: BookDetailsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
