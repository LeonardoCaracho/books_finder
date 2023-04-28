part of 'favorites_cubit.dart';

/// {@template favorites}
/// FavoritesState description
/// {@endtemplate}
class FavoritesState extends Equatable {
  /// {@macro favorites}
  const FavoritesState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current FavoritesState with property changes
  FavoritesState copyWith({
    String? customProperty,
  }) {
    return FavoritesState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template favorites_initial}
/// The initial state of FavoritesState
/// {@endtemplate}
class FavoritesInitial extends FavoritesState {
  /// {@macro favorites_initial}
  const FavoritesInitial() : super();
}
