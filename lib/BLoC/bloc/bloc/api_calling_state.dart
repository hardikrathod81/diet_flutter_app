part of 'api_calling_bloc.dart';

sealed class ApiCallingState extends Equatable {
  const ApiCallingState();

  @override
  List<Object> get props => [];
}

final class ApiCallingInitialState extends ApiCallingState {}

final class ApiCallingLoadingState extends ApiCallingState {}

final class ApiCallingLoadedState extends ApiCallingState {
  final List<PostModel> postmodel;

  const ApiCallingLoadedState(this.postmodel);
  @override
  List<Object> get props => [];
}

final class ApiCallingErrorState extends ApiCallingState {
  final String error;

  const ApiCallingErrorState(this.error);
  @override
  List<Object> get props => [];
}

final class RefreshLoding extends ApiCallingState {}

final class RefreshLoded extends ApiCallingState {}
