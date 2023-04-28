import 'package:books_finder/books_search/books_search.dart';
import 'package:flutter/material.dart';

class BooksSearchBody extends StatelessWidget {
  /// {@macro books_search_body}
  const BooksSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onSubmitted: (text) {
                context.read<BooksSearchBloc>().add(
                      BooksSearchEvent(
                        query: text,
                      ),
                    );
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: 'Search',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<BooksSearchBloc, BooksSearchState>(
                builder: (context, state) {
                  if (state is BooksSearchIsLoadSuccess) {
                    return ListView.builder(
                      itemCount: state.books.length,
                      itemBuilder: (context, index) => SearchResultListTile(
                        book: state.books[index],
                      ),
                    );
                  }

                  if (state is BooksSearchIsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
