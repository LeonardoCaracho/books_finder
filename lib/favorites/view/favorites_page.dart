import 'package:flutter/material.dart';
import 'package:books_finder/favorites/cubit/cubit.dart';
import 'package:books_finder/favorites/widgets/favorites_body.dart';

/// {@template favorites_page}
/// A description for FavoritesPage
/// {@endtemplate}
class FavoritesPage extends StatelessWidget {
  /// {@macro favorites_page}
  const FavoritesPage({super.key});

  /// The static route for FavoritesPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const FavoritesPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(),
      child: const Scaffold(
        body: FavoritesView(),
      ),
    );
  }    
}

/// {@template favorites_view}
/// Displays the Body of FavoritesView
/// {@endtemplate}
class FavoritesView extends StatelessWidget {
  /// {@macro favorites_view}
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesBody();
  }
}
