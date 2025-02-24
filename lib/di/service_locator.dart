import 'package:e_commercial_app/core/config/auth/auth_state_cubit.dart';
import 'package:e_commercial_app/core/services/auth_local_service.dart';
import 'package:e_commercial_app/data/repositories/auth_repository.dart';
import 'package:e_commercial_app/data/repositories/repositoryImp/auth.dart';
import 'package:e_commercial_app/domain/usecases/signin.dart';
import 'package:e_commercial_app/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/services/network/auth_api_services.dart';
import '../core/services/network/dio_client.dart';
import '../domain/usecases/get_user.dart';
import '../domain/usecases/is_logged_in.dart';

final sl = GetIt.instance;

void setupServiceLocator() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<DioClient> (DioClient());

  // Services
  sl.registerSingleton<AuthApiServices>(
      AuthApiServicesImpl()
  );

  sl.registerSingleton<SharedPreferences>(
      sharedPreferences
  );

  // Repositories
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );

  // UseCases
  sl.registerSingleton<SignUpUseCase>(
      SignUpUseCase()
  );

  sl.registerSingleton <AuthLocalService>(
      AuthLocalServiceImpl()
  );

  sl.registerSingleton<IsLoggedInUseCase> (
      IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase()
  );

  sl.registerSingleton<SignInUseCase> (
      SignInUseCase()
  );

  sl.registerLazySingleton<AuthStateCubit>(() => AuthStateCubit());
}