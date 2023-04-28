part of 'books_search_bloc.dart';

/// {@template books_search_state}
/// BooksSearchState description
/// {@endtemplate}
class BooksSearchState extends Equatable {
  /// {@macro books_search_state}
  const BooksSearchState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current BooksSearchState with property changes
  BooksSearchState copyWith({
    String? customProperty,
  }) {
    return BooksSearchState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template books_search_initial}
/// The initial state of BooksSearchState
/// {@endtemplate}
class BooksSearchInitial extends BooksSearchState {
  /// {@macro books_search_initial}
  const BooksSearchInitial() : super();
}
