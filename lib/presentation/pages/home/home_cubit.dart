import 'package:bloc/bloc.dart';

import '../../../di/service_locator.dart';
import '../../../domain/usecases/get_user.dart';
import 'home_state.dart';

class UserDisplayCubit extends Cubit<HomeState> {
  UserDisplayCubit() : super(UserLoading());

  void displayUser() async {
    try {
      print("📡 Fetching user data...");

      var result = await sl<GetUserUseCase>().call();

      result.fold(
            (error) {
          print("❌ Load user failed: $error");
          emit(LoadUserFailure(errorMessage: error));
        },
            (userEntity) {
          print("✅ User loaded: ${userEntity.username}");
          emit(UserLoaded(userEntity: userEntity));
        },
      );

      print("🛠 State after emit: $state");
    } catch (e) {
      print("🔥 Exception: $e");
      emit(LoadUserFailure(errorMessage: "Unexpected error occurred"));
    }
  }
}
