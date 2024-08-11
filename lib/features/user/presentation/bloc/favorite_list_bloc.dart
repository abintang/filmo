import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/user/domain/usecase/get_favorite_list.dart';
import 'package:filmo/features/user/presentation/bloc/event/favorite_list_event.dart';
import 'package:filmo/features/user/presentation/bloc/state/favorite_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  FavoriteListBloc() : super(LoadingState()) {
    on<LoadFavoriteList>(_onLoadFavoriteList);
  }

  void _onLoadFavoriteList(
      LoadFavoriteList event, Emitter<FavoriteListState> emit) async {
    emit(LoadingState());
    try {
      final movies = await getIt.get<GetFavoriteList>().call(event.id);
      emit(GetFavoriteListSuccess(movies: movies));
    } catch (e) {
      emit(GetFavoriteListFailed());
    }
  }
}
