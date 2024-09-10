import 'package:flutter/material.dart';
import 'package:food_store/config/router/main_navigation.dart';
import 'package:food_store/core/core.dart';
import 'package:get_it/get_it.dart';

class StoreScreenAppBar extends StatelessWidget {
  const StoreScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            TextButton(
              onPressed: () async {
                GetIt.I<AppRouter>().push(const MainFoodStoreRoute());
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return elementsClr;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return elementsClr.withOpacity(0.5);
                    }
                    return null;
                  },
                ),
              ),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    color: whiteClr,
                    fontFamily: fontApp,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Food',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    TextSpan(
                      text: 'Store',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    textClr.withOpacity(0.3),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return elementsClr;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return elementsClr.withOpacity(0.5);
                      }
                      return null;
                    },
                  ),
                ),
                child: Text(
                  'Магазины',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteClr,
                    fontFamily: fontApp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return elementsClr;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return elementsClr.withOpacity(0.5);
                      }
                      return null;
                    },
                  ),
                ),
                child: Text(
                  'Товары',
                  style: TextStyle(
                    fontSize: 16,
                    color: textClr,
                    fontFamily: fontApp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return elementsClr;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return elementsClr.withOpacity(0.5);
                      }
                      return null;
                    },
                  ),
                ),
                child: Text(
                  'Цены и наценки',
                  style: TextStyle(
                    fontSize: 16,
                    color: textClr,
                    fontFamily: fontApp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return elementsClr;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return elementsClr.withOpacity(0.5);
                      }
                      return null;
                    },
                  ),
                ),
                child: Text(
                  'Аналитика',
                  style: TextStyle(
                    fontSize: 16,
                    color: textClr,
                    fontFamily: fontApp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return elementsClr;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return elementsClr.withOpacity(0.5);
                      }
                      return null;
                    },
                  ),
                ),
                child: Text(
                  'Сотрудники',
                  style: TextStyle(
                    fontSize: 16,
                    color: textClr,
                    fontFamily: fontApp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return elementsClr;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return elementsClr.withOpacity(0.5);
                      }
                      return null;
                    },
                  ),
                ),
                child: Text(
                  'Реклама',
                  style: TextStyle(
                    fontSize: 16,
                    color: textClr,
                    fontFamily: fontApp,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              highlightColor: elementsClr,
              icon: Icon(
                Icons.account_circle_rounded,
                color: textClr,
              ),
            )
          ],
        ),
      ],
    );
  }
}
