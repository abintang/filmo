import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/home/domain/usecase/get_now_playing.dart';
import 'package:filmo/features/home/presentation/bloc/event/now_playing_event.dart';
import 'package:filmo/features/home/presentation/bloc/state/now_playing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(LoadingState()) {
    on<LoadNowPlaying>(_onLoadNowPlaying);
  }

  void _onLoadNowPlaying(
      LoadNowPlaying event, Emitter<NowPlayingState> emit) async {
    emit(LoadingState());
    try {
      final movies = await getIt.get<GetNowPlaying>().call();
      emit(GetNowPlayingSuccess(movies: movies));
    } catch (e) {
      emit(GetNowPlayingFailed());
    }
  }
}
