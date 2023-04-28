import 'package:bloc_test/bloc_test.dart';
import 'package:books_finder/book_details/book_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockBooksRepository extends Mock implements BooksRepository {}

void main() {
  var mockBook = Book(
    id: '1',
    authors: const [],
    categories: const [],
    description: "",
    pageCount: 0,
    publishedDate: "",
    publisher: "",
    title: "",
    buyLink: "",
    thumbnail: "",
  );

  setUpAll(() {
    registerFallbackValue(mockBook);
  });
  group('BookDetailsCubit', () {
    late BooksRepository booksRepository;
    late BookDetailsCubit bookDetailsCubit;

    setUp(() {
      booksRepository = MockBooksRepository();
      bookDetailsCubit = BookDetailsCubit(
        booksRepository: booksRepository,
      );
    });

    tearDown(() {
      bookDetailsCubit.close();
    });

    test('initial state is correct', () {
      expect(bookDetailsCubit.state, const BookDetailsState());
    });

    blocTest<BookDetailsCubit, BookDetailsState>(
      'emits [loading, success] states when addBookToFavorites is called',
      build: () {
        when(() => booksRepository.saveBook(any())).thenAnswer((_) async {});
        return bookDetailsCubit;
      },
      act: (cubit) => cubit.addBookToFavorites(mockBook),
      expect: () => [
        const BookDetailsState(status: Status.loading),
        const BookDetailsState(status: Status.success),
      ],
    );

    blocTest<BookDetailsCubit, BookDetailsState>(
      'emits [loading, failure] states when addBookToFavorites throws error',
      build: () {
        when(() => booksRepository.saveBook(any())).thenThrow(Exception('error'));
        return bookDetailsCubit;
      },
      act: (cubit) => cubit.addBookToFavorites(mockBook),
      expect: () => [
        const BookDetailsState(status: Status.loading),
        const BookDetailsState(status: Status.failure),
      ],
    );
  });
}
