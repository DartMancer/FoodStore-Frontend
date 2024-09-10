// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'main_navigation.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FirstTestRoute.name: (routeData) {
      final args = routeData.argsAs<FirstTestRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FirstTestScreen(
          key: args.key,
          eventMedia: args.eventMedia,
        ),
      );
    },
    MainFoodStoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainFoodStoreScreen(),
      );
    },
    StoreRoute.name: (routeData) {
      final args = routeData.argsAs<StoreRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StoreScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    StoresRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoresScreen(),
      );
    },
  };
}

/// generated route for
/// [FirstTestScreen]
class FirstTestRoute extends PageRouteInfo<FirstTestRouteArgs> {
  FirstTestRoute({
    Key? key,
    required String eventMedia,
    List<PageRouteInfo>? children,
  }) : super(
          FirstTestRoute.name,
          args: FirstTestRouteArgs(
            key: key,
            eventMedia: eventMedia,
          ),
          initialChildren: children,
        );

  static const String name = 'FirstTestRoute';

  static const PageInfo<FirstTestRouteArgs> page =
      PageInfo<FirstTestRouteArgs>(name);
}

class FirstTestRouteArgs {
  const FirstTestRouteArgs({
    this.key,
    required this.eventMedia,
  });

  final Key? key;

  final String eventMedia;

  @override
  String toString() {
    return 'FirstTestRouteArgs{key: $key, eventMedia: $eventMedia}';
  }
}

/// generated route for
/// [MainFoodStoreScreen]
class MainFoodStoreRoute extends PageRouteInfo<void> {
  const MainFoodStoreRoute({List<PageRouteInfo>? children})
      : super(
          MainFoodStoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainFoodStoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoreScreen]
class StoreRoute extends PageRouteInfo<StoreRouteArgs> {
  StoreRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          StoreRoute.name,
          args: StoreRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'StoreRoute';

  static const PageInfo<StoreRouteArgs> page = PageInfo<StoreRouteArgs>(name);
}

class StoreRouteArgs {
  const StoreRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'StoreRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [StoresScreen]
class StoresRoute extends PageRouteInfo<void> {
  const StoresRoute({List<PageRouteInfo>? children})
      : super(
          StoresRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoresRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
