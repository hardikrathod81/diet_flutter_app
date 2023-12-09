part of 'api_calling_bloc.dart';

sealed class ApiCallingEvent extends Equatable {
  const ApiCallingEvent();

  @override
  List<Object> get props => [];
}

final class ApiCallingLoadEvent extends ApiCallingEvent {
  @override
  List<Object> get props => [];
}

final class RefreshBlocEvent extends ApiCallingEvent {}
