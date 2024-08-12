import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/home/domain/usecase/post_movie_to_list.dart';
import 'package:filmo/features/home/presentation/bloc/event/action_on_movie_event.dart.dart';
import 'package:filmo/features/home/presentation/bloc/state/action_on_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionOnMovieBloc extends Bloc<ActionOnMovieEvent, ActionOnMovieState> {
  ActionOnMovieBloc() : super(InitialState()) {
    on<AddListMovieEvent>(_onAddMovieToList);
  }

  void _onAddMovieToList(
      AddListMovieEvent event, Emitter<ActionOnMovieState> emit) async {
    try {
      await getIt
          .get<PostMovieToList>()
          .call(event.accountId, event.movieId, event.saveType);
      emit(AddMovieToListSuccess());
    } catch (e) {
      emit(AddMovieToListFailed());
    }
  }
}
