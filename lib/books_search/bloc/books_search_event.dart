part of 'books_search_bloc.dart';

abstract class BooksSearchEvent  extends Equatable {
  const BooksSearchEvent();
}

/// {@template custom_books_search_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomBooksSearchEvent extends BooksSearchEvent {
  /// {@macro custom_books_search_event}
  const CustomBooksSearchEvent();


  @override
  List<Object> get props => [];

}
