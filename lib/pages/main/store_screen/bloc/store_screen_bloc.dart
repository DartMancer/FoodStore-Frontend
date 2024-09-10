import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';

part 'store_screen_event.dart';
part 'store_screen_state.dart';

class StoreScreenBloc extends Bloc<StoreScreenEvent, StoreScreenState> {
  StoreScreenBloc(this.id, this.storesScreenApi) : super(StoreScreenInitial()) {
    on<LoadStoreScreenData>((event, emit) async {
      try {
        emit(StoreScreenLoading());
        final storesData = await storesScreenApi.getStoreApi(id: id);
        emit(StoreScreenLoaded(storesData: storesData));
      } catch (e, st) {
        emit(MainScreenLoadingFailure(exception: e));
        Logger().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
  final int id;
  final StoresScreenApi storesScreenApi;
}
