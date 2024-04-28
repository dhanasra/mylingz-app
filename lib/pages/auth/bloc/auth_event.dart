// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignupEvent extends AuthEvent {
  final String fname;
  final String lname;
  final String email;
  final String password;

  SignupEvent({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class GoogleLoginEvent extends AuthEvent{}
