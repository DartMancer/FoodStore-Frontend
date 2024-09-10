import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:food_store/config/router/main_navigation.dart';
import 'package:food_store/config/theme/theme_provider.dart';

import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FoodStore extends StatefulWidget {
  const FoodStore({
    super.key,
  });

  @override
  State<FoodStore> createState() => _FoodStoreState();
}

class _FoodStoreState extends State<FoodStore> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => CustomThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<CustomThemeProvider>(context);
          return OverlaySupport.global(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'VKURSE',
              localizationsDelegates: const [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ru', 'RU'), // English
              ],
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              routerConfig: GetIt.I<AppRouter>().config(
                deepLinkBuilder: (deepLink) async {
                  return DeepLink.single(const StoresRoute());
                },
                navigatorObservers: () => [
                  TalkerRouteObserver(GetIt.I<Talker>()),
                ],
              ),
            ),
          );
        },
      );
}
