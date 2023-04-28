import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(const BookDetailsInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
