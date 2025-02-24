import 'package:dartz/dartz.dart';
import 'package:e_commercial_app/data/repositories/auth_repository.dart';
import 'package:e_commercial_app/domain/usecases/usecases.dart';
import '../../di/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {

  @override
  Future <Either> call ({dynamic params}) async {
    return sl <AuthRepository>().getUser();
  }

}