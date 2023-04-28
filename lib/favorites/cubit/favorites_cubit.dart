import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
