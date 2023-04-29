import 'package:books_finder/books_search/books_search.dart';
import 'package:books_finder/favorites/cubit/cubit.dart';
import 'package:books_finder/shared/shared.dart';
import 'package:flutter/material.dart';

class BooksSearchBody extends StatelessWidget {
  /// {@macro books_search_body}
  const BooksSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          _showToast(
            context,
            "Add to favorites failed!",
            color: Colors.red,
          );
        }

        if (state.status.isSuccess) {
          _showToast(context, "Add to favorites succeed!");
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const BooksSearchWidget(),
              Expanded(
                child: BlocBuilder<BooksSearchBloc, BooksSearchState>(
                  builder: (context, state) {
                    if (state is BooksSearchIsLoadSuccess) {
                      if (state.books.isEmpty) {
                        return const BooksEmptyState(
                          text: "We couldn't find any books :(\n Try a different search!",
                        );
                      }

                      return ListView.builder(
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          final book = state.books[index];
                          return BookListTile(
                            book: book,
                            trailIcon: const Icon(
                              Icons.favorite,
                              color: Colors.lightBlue,
                            ),
                            trailAction: () => context.read<FavoritesCubit>().addFavorite(book),
                          );
                        },
                      );
                    }

                    if (state is BooksSearchIsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is BooksSearchIsFailure) {
                      return const BooksEmptyState(
                        text: "Failed to get books!\n try a different text",
                      );
                    }

                    return const BooksEmptyState(
                      text: "Use the Search bar above to find \nyour favorites books!",
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showToast(
    BuildContext context,
    String text, {
    Color color = Colors.green,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
        backgroundColor: color.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
