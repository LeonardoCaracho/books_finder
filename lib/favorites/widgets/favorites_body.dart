import 'package:books_finder/favorites/favorites.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:flutter/material.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state.status.isSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) => FavoritesListTile(
              book: state.books[index],
            ),
          );
        }

        if (state.status.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
