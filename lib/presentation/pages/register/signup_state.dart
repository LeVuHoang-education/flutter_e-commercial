import 'package:e_commercial_app/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class  SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}