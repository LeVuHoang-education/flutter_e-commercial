import 'package:e_commercial_app/domain/usecases/signup.dart';
import 'package:e_commercial_app/presentation/pages/register/signup_event.dart';
import 'package:e_commercial_app/presentation/pages/register/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/auth_repository.dart';


class SignupBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignupBloc({required this.signUpUseCase}) : super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted (SignUpSubmitted event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    final result = await signUpUseCase.call(params: event.signUpReqParams);
    result.fold(
          (failure) => emit(SignUpFailure(failure.toString())),
          (message) => emit(SignUpSuccess(message)),
    );
  }
}


