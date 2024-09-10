import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/main/stores_screen/stores_screen.dart';

part 'stores_screen_event.dart';
part 'stores_screen_state.dart';

class StoresScreenBloc extends Bloc<StoresScreenEvent, StoresScreenState> {
  StoresScreenBloc(this.storesScreenApi) : super(StoresScreenInitial()) {
    on<LoadStoresScreenData>((event, emit) async {
      try {
        emit(StoresScreenLoading());
        final storesData = await storesScreenApi.getStoresListApi(limit: 5);
        emit(StoresScreenLoaded(storesData: storesData));
      } catch (e, st) {
        emit(MainScreenLoadingFailure(exception: e));
        Logger().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
  final StoresScreenApi storesScreenApi;
}
