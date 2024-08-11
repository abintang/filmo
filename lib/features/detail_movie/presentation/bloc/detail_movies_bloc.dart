import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/detail_movie/domain/usecase/get_detail_movies.dart';
import 'package:filmo/features/detail_movie/presentation/bloc/event/detail_movies_event.dart';
import 'package:filmo/features/detail_movie/presentation/bloc/state/detail_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailMoviesBloc extends Bloc<DetailMoviesEvent, DetailMoviesState> {
  DetailMoviesBloc() : super(LoadingDetailMovies()) {
    on<LoadDetailMovies>(_onLoadDetailMovies);
  }

  void _onLoadDetailMovies(
      LoadDetailMovies event, Emitter<DetailMoviesState> emit) async {
    try {
      final detailMovies = await getIt.get<GetDetailMovies>().call(event.id);
      emit(GetDetailMoviesSuccess(detailMovies: detailMovies));
    } catch (e) {
      emit(GetDetailMoviesFailed());
    }
  }
}
