part of 'account_bloc.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

class Loading extends AccountState {}

class AccountDeleted extends AccountState {}

class LoggedOut extends AccountState {}

class Error extends AccountState {}