part of 'stores_screen_bloc.dart';

abstract class StoresScreenEvent extends Equatable {
  const StoresScreenEvent();

  @override
  List<Object> get props => [];

  get completer => null;
}

class LoadStoresScreenData extends StoresScreenEvent {
  const LoadStoresScreenData({this.completer});

  @override
  final Completer? completer;
}
