import 'package:bloc/bloc.dart';

import '../../../data/models/signin/signin_req.dart';
import '../../../domain/usecases/signin.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUseCase signInUseCase;

  LoginBloc({required this.signInUseCase}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await signInUseCase.call(
        params: SigninReqParams(email: event.email, password: event.password)
    );

    result.fold(
          (failure) => emit(LoginFailure(failure.toString())),
          (_) => emit(LoginSuccess()),
    );
  }
}
