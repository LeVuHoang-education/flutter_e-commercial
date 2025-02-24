import 'package:equatable/equatable.dart';

import '../../../data/models/signup/signup_req.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpSubmitted extends SignUpEvent {
  final SignupReqParams signUpReqParams;

  SignUpSubmitted({required this.signUpReqParams});

  @override
  List<Object> get props => [signUpReqParams];

}