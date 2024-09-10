import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

class ShimmerStock extends StatelessWidget {
  const ShimmerStock({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      height: width * 0.16,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: width * 0.335,
                height: width * 0.03489,
                decoration: BoxDecoration(
                  color: textClr.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: width * 0.007),
            ],
          );
        },
      ),
    );
  }
}
