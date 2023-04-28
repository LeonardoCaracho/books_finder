import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:books_repository/books_repository.dart';
import 'package:equatable/equatable.dart';
part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit({
    required this.booksRepository,
  }) : super(const BookDetailsState());

  final BooksRepository booksRepository;

  /// A description for yourCustomFunction
  FutureOr<void> addBookToFavorites(Book book) async {
    try {
      emit(state.copyWith(status: Status.loading));

      await booksRepository.saveBook(book);

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
