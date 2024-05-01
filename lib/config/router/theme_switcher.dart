import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:food_store/core/core.dart';

class LiteRollingSwitch extends StatefulWidget {
  @required
  final bool value;
  final double width;
  final double height;
  final double borderRadius;

  @required
  final Function(bool) onChanged;
  final String textOff;
  final Color textOffColor;
  final String textOn;
  final Color textOnColor;
  final Color colorOn;
  final Color colorOff;
  final double textSize;
  final Duration animationDuration;
  final Icon iconOn;
  final Icon iconOff;
  final LinearGradient iconOnBackColor;
  final LinearGradient iconOffBackColor;
  final Function onTap;
  final Function onDoubleTap;
  final Function onSwipe;
  final String textFont;

  const LiteRollingSwitch({
    super.key,
    this.value = false,
    this.width = 130,
    this.height = 50,
    this.textOff = "Off",
    this.textOn = "On",
    this.textSize = 14.0,
    this.borderRadius = 20.0,
    this.colorOn = Colors.green,
    this.colorOff = Colors.red,
    required this.iconOff,
    required this.iconOn,
    this.iconOnBackColor =
        const LinearGradient(colors: [Colors.white, Colors.white]),
    this.iconOffBackColor =
        const LinearGradient(colors: [Colors.white, Colors.white]),
    this.animationDuration = const Duration(milliseconds: 600),
    this.textOffColor = Colors.white,
    this.textOnColor = Colors.black,
    required this.onTap,
    required this.onDoubleTap,
    required this.onSwipe,
    this.textFont = fontApp,
    required this.onChanged,
  });

  @override
  State<LiteRollingSwitch> createState() => _RollingSwitchState();
}

class _RollingSwitchState extends State<LiteRollingSwitch>
    with SingleTickerProviderStateMixin {
  /// Late declarations
  late AnimationController animationController;
  late Animation<double> animation;
  late bool turnState;

  double value = 0.0;

  @override
  void dispose() {
    //Ensure to dispose animation controller
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    turnState = widget.value;

    // Executes a function only one time after the layout is completed.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (turnState) {
          animationController.forward();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Color transition animation
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    Color? transitionColor = Color.lerp(widget.colorOff, widget.colorOn, value);
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onDoubleTap: () {
        _action();
        widget.onDoubleTap();
      },
      onTap: () {
        _action();
        widget.onTap();
      },
      onPanEnd: (details) {
        _action();
        widget.onSwipe();
      },
      child: Container(
        // padding: EdgeInsets.all(5),
        width: widget.width,
        decoration: BoxDecoration(
          color: transitionColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: isRTL(context)
                  ? Offset(-10 * value, 0)
                  : Offset(10 * value, 0), //original
              child: Opacity(
                opacity: (1 - value).clamp(0.0, 1.0),
                child: Container(
                  padding: isRTL(context)
                      ? const EdgeInsets.only(left: 10)
                      : const EdgeInsets.only(right: 10),
                  alignment: isRTL(context)
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  height: widget.height,
                  child: SizedBox(
                    width: width * 0.58205,
                    height: width * 0.05641,
                    child: ASText(
                      text: widget.textOff,
                      color: widget.textOffColor,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: isRTL(context)
                  ? Offset(-10 * (1 - value), 0)
                  : Offset(10 * (1 - value), 0), //original
              child: Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: Container(
                  padding: isRTL(context)
                      ? const EdgeInsets.only(right: 10)
                      : const EdgeInsets.only(left: 10),
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  height: widget.height,
                  child: SizedBox(
                    width: width * 0.58205,
                    height: width * 0.05641,
                    child: ASText(
                      text: widget.textOn,
                      color: widget.textOnColor,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: isRTL(context)
                  ? Offset((-widget.width + widget.height) * value, 0)
                  : Offset((widget.width - widget.height) * value, 0),
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  height: widget.height,
                  width: widget.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      gradient: isDarkMode
                          ? widget.iconOffBackColor
                          : widget.iconOnBackColor),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Opacity(
                            opacity: (1 - value).clamp(0.0, 1.0),
                            child: widget.iconOff),
                      ),
                      Center(
                        child: Opacity(
                            opacity: value.clamp(0.0, 1.0),
                            child: widget.iconOn),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _action() {
    _determine(changeState: true);
  }

  _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController.forward()
          : animationController.reverse();

      widget.onChanged(turnState);
    });
  }
}

bool isRTL(BuildContext context) {
  return Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode);
}
