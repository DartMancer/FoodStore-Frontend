import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:food_store/core/core.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ASText extends StatelessWidget {
  const ASText({
    super.key,
    required this.text,
    required this.color,
    required this.textAlign,
    this.overflowReplacement,
    this.overflow,
    this.textStyle,
    this.fontWeight,
  });

  final String text;
  final Color color;
  final TextAlign textAlign;
  final Widget? overflowReplacement;
  final TextOverflow? overflow;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      overflow: overflow,
      overflowReplacement: overflowReplacement,
      style: textStyle ??
          TextStyle(
            fontSize: 70,
            color: color,
            fontFamily: fontApp,
            fontWeight: fontWeight ?? FontWeight.bold,
            decoration: TextDecoration.none,
          ),
    );
  }
}

class Logger {
  var talker = GetIt.I<Talker>();

  void info(dynamic message) {
    talker.info(message);
  }

  void handle(dynamic e, dynamic st) {
    talker.handle(e, st);
  }

  void debug(dynamic message) {
    talker.debug(message);
  }

  void critical(dynamic message) {
    talker.critical(message);
  }
}

// class ChangeThemeButtonWidget extends StatelessWidget {
//   const ChangeThemeButtonWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     double width = mediaQuery.size.width;
//     final themeProvider = Provider.of<CustomThemeProvider>(context);
//     bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

//     return LiteRollingSwitch(
//       onDoubleTap: () {},
//       onSwipe: () {},
//       onTap: () {},
//       onChanged: (value) {
//         final newThemeMode = value ? ThemeMode.dark : ThemeMode.light;
//         themeProvider.themeMode = newThemeMode;
//       },
//       value: isDarkMode,

//       width: width * 0.80641,
//       height: width * 0.12820,

//       borderRadius: width * 0.03076,

//       textOn: 'Темная тема',
//       textOff: 'Светлая тема',
//       textSize: 20,
//       textFont: fontApp,
//       textOnColor: lightGrayClr,
//       textOffColor: mainDarkClr,

//       colorOn: darkThemeClr,
//       colorOff: lightGrayClr,
//       // colorOff: firstGradientClrUser,

//       iconOn: const Icon(
//         CustomIcons.nightMode,
//       ),
//       iconOff: Icon(
//         CustomIcons.sunny,
//         color: lightGrayClr,
//       ),
//       iconOnBackColor: LinearGradient(
//         colors: [firstGradientClrUser, secondGradientClrUser],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       iconOffBackColor: LinearGradient(
//         colors: [firstGradientClrUser, secondGradientClrUser],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//     );
//   }
// }

class NoInternetNotification {
  NoInternetNotification({
    required this.context,
  });

  final BuildContext context;

  void noInternetNotif() {
    showSimpleNotification(
      Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            height: 30,
            child: ASText(
              text: 'Нет подключения к интернету',
              color: Theme.of(context).primaryColor,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
      background: Theme.of(context).canvasColor,
    );
  }
}
