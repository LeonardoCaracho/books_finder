import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:books_repository/books_repository.dart';
import 'package:equatable/equatable.dart';
part 'books_search_event.dart';
part 'books_search_state.dart';

class BooksSearchBloc extends Bloc<BooksSearchEvent, BooksSearchState> {
  BooksSearchBloc({
    required this.booksRepository,
  }) : super(BooksSearchInitial()) {
    on<BooksSearchEvent>(_onBooksSearchEvent);
  }

  final BooksRepository booksRepository;

  FutureOr<void> _onBooksSearchEvent(
    BooksSearchEvent event,
    Emitter<BooksSearchState> emit,
  ) async {
    try {
      emit(BooksSearchIsLoading());

      final books = await booksRepository.getBooksBySearch(event.query);

      emit(BooksSearchIsLoadSuccess(books: books));
    } catch (e) {
      emit(BooksSearchIsFailure());
    }
  }
}
