import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:equatable/equatable.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required this.booksRepository,
  }) : super(const FavoritesState());

  final BooksRepository booksRepository;

  FutureOr<void> getFavorites() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final books = await booksRepository.getStoredBooks();

      emit(
        state.copyWith(
          status: Status.success,
          books: books,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  FutureOr<void> addFavorite(Book book) async {
    try {
      emit(state.copyWith(status: Status.loading));

      await booksRepository.saveBook(book);

      emit(
        state.copyWith(
          status: Status.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  FutureOr<void> deleteFavorite(Book book) async {
    try {
      emit(state.copyWith(status: Status.loading));

      await booksRepository.deleteBook(book);
      final books = await booksRepository.getStoredBooks();

      emit(
        state.copyWith(
          status: Status.success,
          books: books,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
