import 'package:dartz/dartz.dart';
import 'package:e_commercial_app/data/models/signup/signup_req.dart';
import 'package:e_commercial_app/data/repositories/auth_repository.dart';
import 'package:e_commercial_app/domain/usecases/usecases.dart';

import '../../di/service_locator.dart';

class SignUpUseCase implements UseCase <Either, SignupReqParams> {

  @override
  Future <Either> call ({SignupReqParams ? params}) async {
    return sl<AuthRepository>().signup(params!);
  }

}