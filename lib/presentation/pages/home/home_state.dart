import '../../../domain/entities/user.dart';

abstract class HomeState {}

class UserLoading extends HomeState {}

class UserLoaded extends HomeState {
  final UserEntity userEntity;
  UserLoaded({required this.userEntity});
}

class LoadUserFailure extends HomeState {
  final String errorMessage;
  LoadUserFailure({required this.errorMessage});
}