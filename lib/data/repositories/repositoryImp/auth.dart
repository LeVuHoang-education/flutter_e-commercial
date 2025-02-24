import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial_app/core/services/auth_local_service.dart';
import 'package:e_commercial_app/data/models/signin/signin_req.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/services/network/auth_api_services.dart';
import '../../../di/service_locator.dart';
import '../../../domain/entities/user.dart';
import '../../models/signup/signup_req.dart';
import '../auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<String, String>> signup(SignupReqParams signupReqParams) async {
    return await sl<AuthApiServices>().signup(signupReqParams);
  }

  @override
  Future<Either<String, String>> signin(SigninReqParams signinReqParams) async {
      return await sl<AuthApiServices>().signin(signinReqParams);
  }

  @override
  Future<bool> isLoggedIn() {
    return sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either<String, UserEntity>> getUser() async {
    return await sl<AuthApiServices>().getUser();
  }

  @override
  Future<Either> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}
