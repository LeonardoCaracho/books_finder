part of 'books_search_bloc.dart';

class BooksSearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class BooksSearchInitial extends BooksSearchState {}

class BooksSearchIsLoading extends BooksSearchState {}

class BooksSearchIsLoadSuccess extends BooksSearchState {
  BooksSearchIsLoadSuccess({
    required this.books,
  });

  final List<Book> books;
}

class BooksSearchIsFailure extends BooksSearchState {}
