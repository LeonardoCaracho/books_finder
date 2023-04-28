part of 'book_details_cubit.dart';

/// {@template book_details}
/// BookDetailsState description
/// {@endtemplate}
class BookDetailsState extends Equatable {
  /// {@macro book_details}
  const BookDetailsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current BookDetailsState with property changes
  BookDetailsState copyWith({
    String? customProperty,
  }) {
    return BookDetailsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template book_details_initial}
/// The initial state of BookDetailsState
/// {@endtemplate}
class BookDetailsInitial extends BookDetailsState {
  /// {@macro book_details_initial}
  const BookDetailsInitial() : super();
}
