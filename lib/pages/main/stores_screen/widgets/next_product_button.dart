import 'package:flutter/material.dart';
import 'package:food_store/config/router/main_navigation.dart';
import 'package:food_store/core/core.dart';
import 'package:get_it/get_it.dart';

class NextProductButton extends StatelessWidget {
  const NextProductButton({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width * 0.06,
            decoration: BoxDecoration(
              color: elementsClr,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: textClr,
              ),
              SizedBox(
                height: 80,
                child: MaterialButton(
                  onPressed: () {
                    GetIt.I<AppRouter>().push(StoreRoute(id: id));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
