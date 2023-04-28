part of 'books_search_bloc.dart';

class BooksSearchEvent extends Equatable {
  const BooksSearchEvent({
    required this.query,
  });

  final String query;

  @override
  List<Object?> get props => [query];
}
