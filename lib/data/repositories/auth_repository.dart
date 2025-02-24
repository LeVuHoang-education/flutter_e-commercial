import 'package:dartz/dartz.dart';
import 'package:e_commercial_app/data/models/signin/signin_req.dart';

import '../models/signup/signup_req.dart';

abstract class AuthRepository {
  Future <Either> signup(SignupReqParams signupReqParams);
  Future <Either> signin(SigninReqParams signinReqParams);
  Future <bool> isLoggedIn();
  Future <Either> logout();
  Future<Either> refreshToken();
  Future <Either> getUser();

}