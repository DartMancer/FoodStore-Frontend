import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_store/pages/main/main_screen/view/main_screen.dart';
import 'package:food_store/pages/test/first_testpage.dart';

part 'main_navigation.gr.dart';

//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //! Initials
        CustomRoute(
          page: MainFoodStoreRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          reverseDurationInMilliseconds: 150,
        ),
      ];
}
