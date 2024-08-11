import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/auth/domain/usecases/auth_user.dart';
import 'package:filmo/features/auth/presentation/bloc/events/login_event.dart';
import 'package:filmo/features/auth/presentation/bloc/states/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState()) {
    on<OnLoginApp>(_onLoginApp);
  }

  void _onLoginApp(OnLoginApp event, Emitter<LoginState> emit) async {
    try {
      final user =
          await getIt.get<AuthUser>().call(event.username, event.password);
      emit(LoginSuccess(user: user));
    } catch (e) {
      emit(LoginFailed());
    }
  }
}
