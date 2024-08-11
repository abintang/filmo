import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/user/domain/usecase/get_detail_user.dart';
import 'package:filmo/features/user/presentation/bloc/event/detail_user_event.dart';
import 'package:filmo/features/user/presentation/bloc/state/detail_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailUserBloc extends Bloc<DetailUserEvent, DetailUserState> {
  DetailUserBloc() : super(InitialState()) {
    on<LoadDetailUser>(_onLoadDetailUser);
  }

  void _onLoadDetailUser(
      LoadDetailUser event, Emitter<DetailUserState> emit) async {
    try {
      final detailUser = await getIt.get<GetDetailUser>().call(event.id);
      emit(GetDetailUserSuccess(user: detailUser));
    } catch (e) {
      emit(GetDetailUserFailed());
    }
  }
}
