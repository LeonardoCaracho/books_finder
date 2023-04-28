import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'books_search_event.dart';
part 'books_search_state.dart';

class BooksSearchBloc extends Bloc<BooksSearchEvent, BooksSearchState> {
  BooksSearchBloc() : super(const BooksSearchInitial()) {
    on<CustomBooksSearchEvent>(_onCustomBooksSearchEvent);
  }

  FutureOr<void> _onCustomBooksSearchEvent(
    CustomBooksSearchEvent event,
    Emitter<BooksSearchState> emit,
  ) {
    // TODO: Add Logic
  }
}
