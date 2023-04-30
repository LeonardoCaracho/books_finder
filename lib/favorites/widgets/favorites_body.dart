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
          if (state.books.isEmpty) {
            return const BooksEmptyState(
              text: "There are any favorites saved yet :(",
            );
          }

          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) => BookListTile(
              book: state.books[index],
              trailIcon: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              trailAction: () => context.read<FavoritesCubit>().deleteFavorite(state.books[index]),
            ),
          );
        } else if (state.status.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status.isFailure) {
          return const BooksEmptyState(
            text: "Failed to retrieve your favorites, try again!",
          );
        } else {
          return const BooksEmptyState(
            text: "Here you can find your saved favorites!",
          );
        }
      },
    );
  }
}
