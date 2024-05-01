import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FirstTestScreen extends StatefulWidget {
  const FirstTestScreen({
    Key? key,
    required this.eventMedia,
  }) : super(key: key);

  final String eventMedia;

  @override
  State<FirstTestScreen> createState() => _FirstTestScreenState();
}

class _FirstTestScreenState extends State<FirstTestScreen> {
  double _scaleFactor = 1.0;
  final double _minScale = 1.0;
  final double _maxScale = 2.0;

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    // var width = mediaQuery.size.width;
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (_scaleFactor >= 1.0) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _scaleFactor = (_maxScale - _minScale) *
                      (0 -
                          (scrollNotification.metrics.pixels /
                              scrollNotification.metrics.maxScrollExtent)) +
                  _minScale;

              // Ограничиваем _scaleFactor, чтобы он не опускался ниже 1.0
              _scaleFactor = _scaleFactor.clamp(1.0, double.infinity);
            });
          }
        } else {
          setState(() {
            _scaleFactor = 1.0;
          });
        }
        return true;
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              color: Colors.redAccent,
            ),
            Container(
              height: 240.0,
              color: Colors.cyanAccent,
            ),
            Container(
              height: 180.0,
              color: Colors.pinkAccent,
            ),
            Container(
              height: 300.0,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
