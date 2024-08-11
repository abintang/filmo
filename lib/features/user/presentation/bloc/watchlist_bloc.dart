import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/user/domain/usecase/get_watchlist.dart';
import 'package:filmo/features/user/presentation/bloc/event/watchlist_event.dart';
import 'package:filmo/features/user/presentation/bloc/state/watchlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(LoadingWatchlistState()) {
    on<LoadWatchlist>(_onLoadFavoriteList);
  }

  void _onLoadFavoriteList(
      LoadWatchlist event, Emitter<WatchlistState> emit) async {
    emit(LoadingWatchlistState());
    try {
      final movies = await getIt.get<GetWatchlist>().call(event.id);
      emit(GetWatchlistSuccess(movies: movies));
    } catch (e) {
      emit(GetWatchlistFailed());
    }
  }
}
