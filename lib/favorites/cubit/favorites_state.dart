part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  /// {@macro favorites}
  const FavoritesState({
    this.status = Status.initial,
    this.books = const [],
  });

  final Status status;
  final List<Book> books;

  @override
  List<Object> get props => [status, books];

  FavoritesState copyWith({
    Status? status,
    List<Book>? books,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      books: books ?? this.books,
    );
  }
}
