
import 'package:dartz/dartz.dart';
import 'package:e_commercial_app/data/models/signin/signin_req.dart';
import 'package:e_commercial_app/domain/usecases/usecases.dart';

import '../../data/repositories/auth_repository.dart';
import '../../di/service_locator.dart';

class SignInUseCase implements UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}