part of 'book_details_cubit.dart';

class BookDetailsState extends Equatable {
  /// {@macro book_details}
  const BookDetailsState({
    this.status = Status.initial,
  });

  final Status status;

  @override
  List<Object> get props => [status];

  BookDetailsState copyWith({
    Status? status,
  }) {
    return BookDetailsState(
      status: status ?? this.status,
    );
  }
}
