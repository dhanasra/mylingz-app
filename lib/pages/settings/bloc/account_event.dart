part of 'account_bloc.dart';

@immutable
sealed class AccountEvent {}

class LogoutEvent extends AccountEvent {}

class DeleteAccountEvent extends AccountEvent {}