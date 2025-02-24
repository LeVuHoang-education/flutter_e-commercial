import 'package:e_commercial_app/data/repositories/auth_repository.dart';
import 'package:e_commercial_app/domain/usecases/usecases.dart';

import '../../di/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic > {
  @override
  Future<bool> call ({dynamic params}) async {
    return sl<AuthRepository>().isLoggedIn();
  }
}