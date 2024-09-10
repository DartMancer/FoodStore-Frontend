part of 'store_screen_bloc.dart';

abstract class StoreScreenEvent extends Equatable {
  const StoreScreenEvent();

  @override
  List<Object> get props => [];

  get completer => null;
}

class LoadStoreScreenData extends StoreScreenEvent {
  const LoadStoreScreenData({this.completer});

  @override
  final Completer? completer;
}
