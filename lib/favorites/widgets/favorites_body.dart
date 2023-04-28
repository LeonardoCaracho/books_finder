import 'package:flutter/material.dart';
import 'package:books_finder/favorites/cubit/cubit.dart';

/// {@template favorites_body}
/// Body of the FavoritesPage.
///
/// Add what it does
/// {@endtemplate}
class FavoritesBody extends StatelessWidget {
  /// {@macro favorites_body}
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
