import 'package:bloc_test/bloc_test.dart';
import 'package:books_finder/books_search/books_search.dart';
import 'package:books_repository/books_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBooksRepository extends Mock implements BooksRepository {}

void main() {
  group('BooksSearchBloc', () {
    late BooksRepository booksRepository;

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

    setUp(() {
      booksRepository = MockBooksRepository();
    });

    blocTest<BooksSearchBloc, BooksSearchState>(
      'emits [BooksSearchIsLoading, BooksSearchIsLoadSuccess] when successful search is performed',
      build: () => BooksSearchBloc(booksRepository: booksRepository),
      act: (bloc) async {
        when(() => booksRepository.getBooksBySearch(any())).thenAnswer((_) async => [mockBook]);
        bloc.add(const BooksSearchEvent(query: 'book'));
        await untilCalled(() => booksRepository.getBooksBySearch(any()));
      },
      expect: () => [
        BooksSearchIsLoading(),
        BooksSearchIsLoadSuccess(books: [mockBook]),
      ],
    );

    blocTest<BooksSearchBloc, BooksSearchState>(
      'emits [BooksSearchIsLoading, BooksSearchIsFailure] when unsuccessful search is performed',
      build: () => BooksSearchBloc(booksRepository: booksRepository),
      act: (bloc) async {
        when(() => booksRepository.getBooksBySearch(any())).thenThrow(Exception());
        bloc.add(const BooksSearchEvent(query: 'unknown'));
        await untilCalled(() => booksRepository.getBooksBySearch(any()));
      },
      expect: () => [
        BooksSearchIsLoading(),
        BooksSearchIsFailure(),
      ],
    );
  });
}
