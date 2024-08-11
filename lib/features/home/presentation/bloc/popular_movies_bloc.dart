import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/home/domain/usecase/get_popular_movies.dart';
import 'package:filmo/features/home/presentation/bloc/event/popular_movies_event.dart';
import 'package:filmo/features/home/presentation/bloc/state/popular_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super(LoadingPopularState()) {
    on<LoadPopularMovies>(_onLoadPopularMovies);
  }

  void _onLoadPopularMovies(
      PopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    emit(LoadingPopularState());
    try {
      final movies = await getIt.get<GetPopularMovies>().call();
      emit(GetPopularMoviesSuccess(movies: movies));
    } catch (e) {
      emit(GetPopularMoviesFailed());
    }
  }
}
