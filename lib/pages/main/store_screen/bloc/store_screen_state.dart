part of 'store_screen_bloc.dart';

abstract class StoreScreenState extends Equatable {
  const StoreScreenState();

  @override
  List<Object> get props => [];
}

final class StoreScreenInitial extends StoreScreenState {}

final class StoreScreenLoading extends StoreScreenState {}

class StoreScreenLoaded extends StoreScreenState {
  const StoreScreenLoaded({required this.storesData});

  final StoreModel storesData;

  @override
  List<Object> get props => [storesData];
}

class MainScreenLoadingFailure extends StoreScreenState {
  MainScreenLoadingFailure({
    required this.exception,
  });
  final Object? exception;

  @override
  List<Object> get props => [exception!];
}
