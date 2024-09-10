part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  @override
  List<Object> get props => [];

  get completer => null;
}

class LoadMainScreenData extends MainScreenEvent {
  LoadMainScreenData({
    this.completer,
  });

  @override
  final Completer? completer;
}
