import 'package:equatable/equatable.dart';
import '../models/login_response.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse response;

  const LoginSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class LoginFailure extends LoginState {
  final String error;
  final int? statusCode;

  const LoginFailure({required this.error, this.statusCode});

  @override
  List<Object?> get props => [error, statusCode];
}
