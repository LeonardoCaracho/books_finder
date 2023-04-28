import 'package:bloc_test/bloc_test.dart';
import 'package:books_finder/favorites/favorites.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBooksRepository extends Mock implements BooksRepository {}

void main() {
  final book = Book(
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
  late BooksRepository booksRepository;

  setUp(() {
    booksRepository = MockBooksRepository();
  });

  group('FavoritesCubit', () {
    test('initial state is correct', () {
      expect(FavoritesCubit(booksRepository: booksRepository).state, const FavoritesState());
    });

    blocTest<FavoritesCubit, FavoritesState>(
      'emits success status when getFavorites is called',
      build: () {
        when(() => booksRepository.getStoredBooks()).thenAnswer((_) => Future.value([book]));
        return FavoritesCubit(booksRepository: booksRepository);
      },
      act: (cubit) => cubit.getFavorites(),
      expect: () => [
        const FavoritesState(status: Status.loading),
        FavoritesState(status: Status.success, books: [book]),
      ],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'emits failure status when getFavorites fails',
      build: () {
        when(() => booksRepository.getStoredBooks()).thenThrow(Exception('something went wrong'));
        return FavoritesCubit(booksRepository: booksRepository);
      },
      act: (cubit) => cubit.getFavorites(),
      expect: () => [
        const FavoritesState(status: Status.loading),
        const FavoritesState(status: Status.failure),
      ],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'addFavorite emits success status',
      build: () {
        when(() => booksRepository.saveBook(book)).thenAnswer((_) => Future.value(null));
        return FavoritesCubit(booksRepository: booksRepository);
      },
      act: (cubit) => cubit.addFavorite(book),
      expect: () => [
        const FavoritesState(status: Status.loading),
        const FavoritesState(status: Status.success),
      ],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'deleteFavorite emits success status when successful',
      build: () {
        when(() => booksRepository.deleteBook(book)).thenAnswer((_) => Future.value(null));
        when(() => booksRepository.getStoredBooks()).thenAnswer((_) => Future.value([]));
        return FavoritesCubit(booksRepository: booksRepository);
      },
      act: (cubit) => cubit.deleteFavorite(book),
      expect: () => [
        const FavoritesState(status: Status.loading),
        const FavoritesState(status: Status.success, books: []),
      ],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'deleteFavorite emits failure status when delete fails',
      build: () {
        when(() => booksRepository.deleteBook(book)).thenThrow(Exception('something went wrong'));
        return FavoritesCubit(booksRepository: booksRepository);
      },
      act: (cubit) => cubit.deleteFavorite(book),
      expect: () => [
        const FavoritesState(status: Status.loading),
        const FavoritesState(status: Status.failure),
      ],
    );
  });
}
