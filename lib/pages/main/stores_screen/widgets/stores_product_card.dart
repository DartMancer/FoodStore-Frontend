import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';

class StoresProductCard extends StatelessWidget {
  const StoresProductCard({
    super.key,
    required this.index,
    required this.storeData,
  });
  final int index;
  final StoreModel storeData;

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
          SizedBox(
            width: width * 0.06,
            height: width * 0.04,
            child: ASText(
              text: storeData.productsList[index].productName,
              color: textClr,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
