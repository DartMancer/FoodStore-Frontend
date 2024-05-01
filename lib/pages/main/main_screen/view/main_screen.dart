import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_store/core/constants/constants.dart';
import 'package:food_store/core/core.dart';

@RoutePage()
class MainFoodStoreScreen extends StatefulWidget {
  const MainFoodStoreScreen({super.key});

  @override
  State<MainFoodStoreScreen> createState() => _MainFoodStoreScreenState();
}

class _MainFoodStoreScreenState extends State<MainFoodStoreScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBar(
        backgroundColor: backgroundClr,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                TextButton(
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
                      'Магазины',
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
                      'Аналитика',
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
        ),
      ),
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: width * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * 0.7,
                    height: width * 0.4,
                    decoration: BoxDecoration(
                      color: elementsClr,
                      borderRadius: BorderRadius.circular(width * 0.01),
                    ),
                  ),
                  Container(
                    width: width * 0.25,
                    height: width * 0.4,
                    decoration: BoxDecoration(
                      color: elementsClr,
                      borderRadius: BorderRadius.circular(width * 0.01),
                    ),
                  ),
                ],
              ),
              SizedBox(height: width * 0.02),
              Container(
                width: width * 0.970,
                height: width * 0.2,
                decoration: BoxDecoration(
                  color: elementsClr,
                  borderRadius: BorderRadius.circular(width * 0.01),
                ),
              ),
              SizedBox(height: width * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
