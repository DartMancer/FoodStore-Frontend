part of 'stores_screen_bloc.dart';

abstract class StoresScreenState extends Equatable {
  const StoresScreenState();

  @override
  List<Object> get props => [];
}

final class StoresScreenInitial extends StoresScreenState {}

class StoresScreenLoading extends StoresScreenState {}

class StoresScreenLoaded extends StoresScreenState {
  const StoresScreenLoaded({required this.storesData});

  final List<StoreModel> storesData;

  @override
  List<Object> get props => [storesData];
}

class MainScreenLoadingFailure extends StoresScreenState {
  MainScreenLoadingFailure({
    required this.exception,
  });
  final Object? exception;

  @override
  List<Object> get props => [exception!];
}
