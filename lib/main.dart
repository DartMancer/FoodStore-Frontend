import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:food_store/foodstore.dart';
import 'package:food_store/config/router/main_navigation.dart';

Future<void> main() async {
  mainRegs();
  runZonedGuarded(
    () async {
      await runZoneRegs();
      runApp(Phoenix(child: const FoodStore()));
    },
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}

Future<void> runZoneRegs() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(await SharedPreferences.getInstance());
}

void mainRegs() {
  Talker talker = regTalker();
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
  regDio(talker);
  regFlutterError();
  regBloc(talker);
  timeago.setLocaleMessages('ru', timeago.RuShortMessages());
}

void regFlutterError() {
  FlutterError.onError = (details) => GetIt.I<Talker>().handle(
        details.exception,
        details.stack,
      );
}

void regBloc(Talker talker) {
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );
}

void regDio(Talker talker) {
  BaseOptions options = BaseOptions(
    connectTimeout: const Duration(seconds: 20),
  );

  final dio = Dio(options);
  dio.interceptors.add(
    TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
      talker: talker,
    ),
  );

  GetIt.I.registerSingleton(dio);
}

Talker regTalker() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');
  return talker;
}
