import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';

import 'store_information.dart';

class StoreBlock extends StatelessWidget {
  const StoreBlock({
    super.key,
    required this.storeData,
  });

  final StoreModel storeData;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Container(
      width: width,
      height: width * 0.15,
      decoration: BoxDecoration(
        color: elementsClr,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: blackClr.withOpacity(0.25),
            offset: const Offset(0, 10),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: width * 0.03,
            child: ASText(
              text: storeData.storeName,
              color: textClr,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: width * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: StoreInformation(storeData: storeData),
          ),
        ],
      ),
    );
  }
}
